import express from "express";
import bodyParser from "body-parser";
import pg from "pg";
import axios from "axios";

const app = express();
const port = 3000;
const apiUrl = "https://api.igdb.com/v4/";
const clientId = '8fnbx9z41r2cwpn8u599u4bmhm0jti';
const authorization = 'Bearer 1fanfm8bkk8nchdxltlc3wud8k5chs';

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static("public"));

const db = new pg.Client({
    user: "postgres",
    host: "localhost",
    database: "game_notes",
    password: "Da7aB4se1",
    port: 5432,
});
db.connect();

async function getGameInfo(gameId = 0){
    if(gameId === 0){
        const results = await db.query("select games.id, name, summary, get_link, image_link, rating from games join reviews on reviews.game = games.id");
        let games = results.rows;
        return games;
    } else {
        const results = await db.query("SELECT * FROM games WHERE id = $1", [gameId]);
        let game = results.rows[0];
        return game;
    }
}

async function getGameReview(gameId){
    const results = await db.query("SELECT review, date_played, play_time, rating FROM reviews WHERE game = $1", [gameId]);
    let review = results.rows[0];
    return review;
}

async function getGameNotes(gameId){
    const results = await db.query("SELECT id, body FROM notes WHERE game = $1", [gameId]);
    let notes = results.rows;
    return notes;
}

app.get("/", async (req, res) => {
    const gameList = await getGameInfo();
    res.render("index.ejs", {gameList: gameList});
});

app.post("/add", async (req, res) => {
    const title = req.body.title;
    const imageLink = req.body.imageLink;
    const summary = req.body.summary;
    const getLink = req.body.getLink;
    const date_played = req.body.datePlayed;
    const play_time = req.body.playTime;
    const review = req.body.review;
    const rating = req.body.rating;
    let newId;

    try {
        const result = await db.query(
            "INSERT INTO games (name, summary, get_link, image_link) VALUES($1, $2, $3, $4) RETURNING games.id", 
            [title, summary, getLink, imageLink]
        );

        newId = result.rows[0].id;

        await db.query(
            "INSERT INTO reviews (game, review, date_played, play_time, rating) VALUES ($1, $2, $3, $4, $5)",
            [newId, review, date_played, play_time, rating]
        );
    } catch (e) {
        console.error(e);
    }
    res.redirect("/"+newId);
});

app.post("/edit", async (req, res) => {
    const id = req.body.gameId;
    const title = req.body.title;
    const imageLink = req.body.imageLink;
    const summary = req.body.summary;
    const getLink = req.body.getLink;
    const date_played = req.body.datePlayed;
    const play_time = req.body.playTime;
    const review = req.body.review;
    const rating = req.body.rating;

    try {
        await db.query(
            "UPDATE games SET name = $1, summary = $2, get_link = $3, image_link = $4 WHERE id = $5", 
            [title, summary, getLink, imageLink, id]
        );
    } catch (e) {
        console.error(e);
    }

    try {
        await db.query(
            "UPDATE reviews SET review = $1, date_played = $2, play_time = $3, rating = $4 WHERE game = $5",
            [review, date_played, play_time, rating, id]
        );
    } catch (e) {
        console.error(e);
    }

    res.redirect("/"+id);
});

app.get("/editGame", async (req, res) => {
    const id = req.query.editGameId;
    const gameInfo = await getGameInfo(id);
    const gameReview = await getGameReview(id);
    const gameNotes = await getGameNotes(id);

    res.render("addGameReview.ejs", {
        gameInfo: gameInfo, 
        gameReview: gameReview, 
        gameNotes: gameNotes
    });
});

app.get("/addGame", async (req, res) => {
    res.render("addGameReview.ejs");
});

app.get("/:id", async (req, res) => {
    const id = req.params.id;
    const gameInfo = await getGameInfo(id);
    const gameReview = await getGameReview(id);
    const gameNotes = await getGameNotes(id);

    res.render("gameNotes.ejs", {
        gameInfo: gameInfo, 
        gameReview: gameReview, 
        gameNotes: gameNotes
    });
});

app.post("/editNote", async (req, res) => {
    try{
        await db.query(
            "UPDATE notes SET body = $1 WHERE id = $2",
            [req.body.updatedNoteBody, req.body.noteId]
        );
    } catch (e) {
        console.error(e);
    }

    res.redirect("/"+req.body.gameId);
});

app.delete("/deleteNote", async (req, res) => {
    try{
        await db.query(
            "DELETE FROM notes WHERE id = $1",
            [req.body.noteId]
        );
    } catch (e){
        console.error(e);
    }
    res.redirect("/"+req.body.gameId);
});

app.delete("/deleteReview", async (req, res) => {
    const id = req.body.id;
    try{
        await db.query(
            "DELETE FROM games WHERE id = $1",
            [id]
        );
      } catch (e){
        console.log(e);
      }
      res.redirect("/");
})

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
  });