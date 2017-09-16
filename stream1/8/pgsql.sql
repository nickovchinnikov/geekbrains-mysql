CREATE TABLE holiday_picnic (
     holiday varchar(50),
     sandwich text[],
     side text[][],
     dessert text ARRAY,
     beverage text ARRAY[4]
);

INSERT INTO holiday_picnic VALUES ('Labor Day',
                                   '{"roast beef","veggie","turkey"}',
                                   '{{"potato salad","green salad"}, {"chips","crackers"}}',
                                   '{"fruit cocktail","berry pie","ice cream"}',
                                   '{"soda","juice","beer","water"}');

CREATE TABLE trails (
     trail_name varchar(250),
     trail_path path
);

INSERT INTO trails VALUES
     ('Dool Trail - Creeping Forest Trail Loop',
      '((37.172,-122.22261666667),
      (37.171616666667,-122.22385),
      (37.1735,-122.2236),
      (37.175416666667,-122.223),
      (37.1758,-122.22378333333),
      (37.179466666667,-122.22866666667),
      (37.18395,-122.22675),
      (37.180783333333,-122.22466666667),
      (37.176116666667,-122.2222),
      (37.1753,-122.22293333333),
      (37.173116666667,-122.22281666667))');