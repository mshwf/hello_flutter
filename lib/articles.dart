class Article {
  final String text;
  final String domain;
  final String by;
  final String age;
  final int score;
  final int commentsCount;
  const Article(
      {this.text,
      this.domain,
      this.by,
      this.age,
      this.score,
      this.commentsCount});
}
final articles=[
  Article(
    text: 'Watch Andrew and Filip building an app from scratch in Flutter, including all the dead ends, blunders, and runtime errors.',
    domain: 'youtube.com',
    by: 'Google',
    age: '1 year',
    score: 1400,
    commentsCount: 189

  ),
  Article(
    text: "People commonly say, ""natural selection will take care of the anti-vaxxers."" First, it's not cool to wish death on anyone. But second, that's not how natural selection works! Read why.",
    domain: 'twitter.com',
    by: 'Twitter',
    age: '1 minute',
    score: 250,
    commentsCount: 20

  ),
  Article(
    text: 'My answer to What happened to "app generators" that supposedly let you create your own apps with no programming skill?',
    domain: 'twitter.com',
    by: 'RockyLhotka',
    age: '7 min',
    score: 1,
    commentsCount: 2

  ),
  Article(
    text: 'Bernard Chazelle proved that if each bird adjusts its velocity and position to the other birds within a fixed radius, the time it takes to converge to a steady state tends to infinity as the number of birds increases.',
    domain: 'Twitter.com',
    by: 'Fermat''s Library',
    age: '8 hours',
    score: 3200,
    commentsCount: 35

  ),
  Article(
    text: 'This is big: The NSA is recommending the White House abandon the controversial Section 215 phone-metadata surveillance program that national security officials once defended as a critical anti-terrorism tool:',
    domain: 'wsj.com',
    by: 'Brian Fung',
    age: '1 day',
    score: 400,
    commentsCount: 26

  ),
  Article(
    text: 'That''s actually good advice. I don''t like to use seeding in production from my app. If I have seeding, it''s in the migration and I only run migrations for web apps manually, never in the actual app (except for development).',
    domain: 'shawn-wildermuth.com',
    by: 'Shawn',
    age: '1 hour',
    score: 10,
    commentsCount: 3

  ),
];