CREATE TABLE games (
  id serial primary key,
  name varchar(100) not null unique,
  summary text not null,
  get_link text,
  image_link text
)

CREATE TABLE reviews (
  id serial primary key,
  game int references game(id) unique on delete cascade,
  review text not null,
  date_played date,
  play_time varchar(15)
)

CREATE TABLE notes (
  id serial primary key
  game int references game(id) on delete cascade,
  body text not null
)

INSERT INTO games (name, summary, get_link)
VALUES (
    'Zenless Zone Zero', 
    'The story takes place in the near future, where a mysterious natural disaster known as the "Hollows" has occurred. A new kind of city has emerged in this disaster-ridden world known as "New Eridu". This last "oasis" has mastered the technology to co-exist with the Hollows, and is home to a whole host of chaotic, boisterous, dangerous and very active factions. As a professional "Proxy", you will play a crucial role in linking the city with the Hollows.', 
    'https://zenless.hoyoverse.com/en-us/'
), (
    'Final Fantasy XIV: Dawntrail',
    'Blue seas, clear skies, and boundless possibilities await in Dawntrail, the newest expansion pack for the critically acclaimed FINAL FANTASY XIV Online! Explore uncharted territories with familiar faces as you discover new tribes, confront formidable threats, and expand your horizons as hope''s light dawns once more.',
    'https://na.store.square-enix-games.com/final-fantasy-xiv-dawntrail'
);

INSERT INTO reviews (game, review, date_played, play_time)
VALUES (
    1,
    'Zenless Zone Zero is a live-service, action combat, gacha game. Created by Hoyo, makers of Genshin Impact and Honkai Star Rail, this game has impressed me with its gameplay and character design so far. I find the gameplay and visuals very satisfying and love the overly-animated cutscenes. Character design is much less conservative this time around, evident by even the first support character the player receives in Nicolle.The day-to-day activities are fairly minimal and include things like getting a cup of coffee, scratching your daily lotto ticket, opening your video rental store, and spending your energy reserves.I could go on about the character designs in this game, like the fact that female characters aren''t all wearing stillettos for once, but I feel like that can be put elsewhere.For now I''ll say that the game has been very fun and satisfying to play, but my attention can be hard to hold for a gacha game. The lack of an open world certainly helps keep me around though. Sick of those at this point.',
    '07/05/2024 - present',
    '20 hours'
), (
    2,
    'SPOILERS AHEAD:
    Dawntrail is the expansion where the Warrior of Light enters their Kakashi arc. You follow Wuk Lamat, your Naruto, as she learns about the people she wishes to rule over and becomes the next Dawnservant. It starts off slow with some worldbuilding, but picks up pace around mid-way through the story. I had no issue with the pacing as I understood this was the beginning of a new arc in FFXIV''s life.  We were essentially on vacation and took a backseat to allow Wuk Lamat to take the spotlight until our power was required. This more or less continued into the second half of the story, but more focused on Alexandria. A world of advanced technology that uses souls for energy, their queen made a deal with a warmonger to help solve their energy crisis. We, along with Wuk Lamat and the Scions, put a stop to the warmonger and, eventually, shut down their digital afterlife that was draining their society dry of souls. This ends in a confrontation with the queen, who had been dead all along and was just memories possessing robot bodies as needed. We put her down and resolve to help the Alexandrians find their way in their new world. This would all be great... except Wuk Lamat somehow broke out of a digital prison to steal the Warrior of Lights glory at the last second during the final boss fight. This was... kind of crappy feeling. We were finally faced with a threat that demanded we step in, only for Wuk Lamat to show up and steal the show. Wuk Lamat felt like a Mary Sue character throughout the story, but this cemented it for me. Overall, I had no issues with the story. It was no Shadowbringers or Endwalker, but it wasn''t trying to be. I enjoyed it for what it was: a casual adventure helping the potential leader of another land claim the throne. What I didn''t enjoy was the feeling that the writer was constantly crushing on Wuk Lamat, making sure she always found success at every turn. Here''s hoping she takes a break during the patch story.',
    '06/28/2024',
    '40 hours'
);

INSERT INTO notes (game, body)
VALUES (
    1,
    'I enjoy the dynamic of Wise and Belle. They work well together. Wise as the calm, laid-back one and Belle as the out-going gremlin.'
), (
    1,
    'Starting faction is Gentle House, otherwise known as the Cunning Hares.
Billy Kid is knock-off Deadpool, but he''s enjoyable all the same. Seems like a decent attacker, but his pistols have the effective range of shotguns.
Anby seems neat. Very reserved and very cool. Solid starter stunner.
Nicolle is here for 2 very big reasons. Dennies and Ether buffs.
Nekomata is pretty cute, but very energetic for a cat. Her fast-paced attacker playstyle is only held back by the lack of decent physical teammates.'
), (
    1,
    'Next is Belobog Heavy Industries, a construction company made up of 80% bears.
I love Ben Bigger. Belobog is a great company. He''s a fire tank, but I''m not really sure what role tanks fill in this game.
Anton is knock-off Kamina from Guren Lagann and I can''t be convinced otherwise. Lightning attacker that has to charge up his drill to deal real damage.
Koleda having special moves with Ben is a neat feature that I hope continues into other characters. She''s a fire stunner and the only one of her kind.
Grace is uh... wow. I''m sure Anomaly characters will increase in value as more of them pop up for Discord teams.'
), (
    1,
    'Only 1 from Section 6.
Soukaku is a blue oni and an incredible support for ice teams. Her buff even helps non-ice teammates with a flat attack buff.'
), (
    1,
    'Only 2 units from Sons of Calydon so far.
Piper is a young girl whose always sleep. Seems to be a gear head and part of a biker gang. She''s a physical anomaly with a pretty fun playstyle. Not my type of character design though.
Lucy is another biker gang member, but seems to be hiding a delinquent personality behind a prim and proper facade. Fire support with little pigs that stay out after she leave the field to continue biting ankles.'
), (
    1,
    'Last, but certainly not least, is Victoria Housekeeping Company. Maids aplenty, plus a cool wolf butler.
Risa is uh... wow. Pen buff is good for all characters so she''s a pretty solid support and very flexible in lightning teams.
Lycaon is a gentleman and a badass. Also the best stunner in the game on launch, but that''s besides the point. Ice type, so enables Ellen and works with Soukaku.
Corin is a young maid with a Frankenstein''s Monster theme. She''s a good attacker, but suffers from needing time to do damage. She works well with Lycaon, so a decent fill until a good ice attacker graces your roster.
Ellen is a shark-tailed maid and the first featured character of the game and has received praised as one of the best attackers in the game. I believe this to be because she''s ice and works with the best stunner and support in the game, who are also ice.'
), (
    1,
    'Still early in the game''s life, but has a lot of potential. I don''t doubt Hoyo will deliver with this one.'
), (
    2,
    'Turiyolal is beautiful city and the jazzy music is fantastic.
Solution Nine feels ripped right out of PSO.'
), (
    2,
    'Wuk Lamat''s sea sickness doesn''t need to be played out every single time we board a boat.
Koana is 100% a Sharla-boo (Sharlayan Weaboo).
I enjoy Erenville''s personality. A welcome contract to Wuk Lamat''s constant upbeat nature.
Queen Sphene is fun to say. Also she looks like a PSO character.'
), (
    2,
    'Feels like most jobs just got more of what they already were this expansion. VFX buffs and role action cooldown reductions. Makes level syncing feel even worse than it already does.
I do not like the new dashes for Dark Knight, Gunbreaker, and Dragoon. The animations just lack compared to the previous ones. I do like the removal of damage from a utility skill though.'
), (
    2,
    'I really like the Mamool Ja forest. Feels alien with the blue flora and rainbow bananas.'
), (
    2,
    'Oh, hello Titan. Didn''t expect to see you at the end of the 95 dungeon.'
), (
    2,
    'I was not expecting to visit the Wild West after the right of succession was over, but I''m digging it. 
Of course there are trains. Of course they''re broken.
Also: Elene''shpya.'
), (
    2,
    'Vanguard was a great dungeon with great glam.'
), (
    2,
    'Encounter design has been going hard this expansion and I''m loving it.'
), (
    2,
    'Regulators containing souls that allow for resurrection and fusing animal/breast souls into your own for a power boost. Also they make you forget dead people.'
), (
    2,
    'Zoraal Ja looks like Galactus if he was from PSO... and a lizard man.'
), (
    2,
    'She was dead the whole time. She wanted us dead the whole time.'
), (
    2,
    'Zoraal Ja''s fight music was an absolute jam.'
), (
    2,
    'Alexandria invented heaven. 
Heaven was driving up the soul bill so we had to turn it off.'
), (
    2,
    'I love all the Krile we''ve gotten this expansion.'
), (
    2,
    'Alexandria dungeon was another dungeon with a story throughout it and I really enjoy these kinds of dungeons.'
), (
    2,
    'Queen Sphene turns into a giant robot and tries to kill us. At least she realizes the real threat is us.
Shoved Wuk Lamat and the others into digital cages so we can go 1-on-1... er... 8-on-1. Azim stone and all.
AND OF COURSE here comes Wuk Lamat to save the day. Heaven forbid we get even 1 thing this expansion. Wuk Lamat just has to take every bit of glory. Who ever is writing her, I don''t like them.'
), (
    2,
    'Post-compaign dungeons are amazing.
I''m looking forward to more content, but I really hope Wuk Lamat just kind of... fades away. I''m sure she won''t, but I can dream.'
);