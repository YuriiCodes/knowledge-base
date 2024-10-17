% Taxonomic relationships is_a (instrument categories)
is_a(violin, bowed_string_instrument).
is_a(cello, bowed_string_instrument).
is_a(guitar, plucked_string_instrument).
is_a(bass_guitar, plucked_string_instrument).
is_a(bowed_string_instrument, string_instrument).
is_a(plucked_string_instrument, string_instrument).
is_a(string_instrument, musical_instrument).

is_a(trumpet, valved_brass_instrument).
is_a(trombone, slide_brass_instrument).
is_a(valved_brass_instrument, brass_instrument).
is_a(slide_brass_instrument, brass_instrument).
is_a(brass_instrument, musical_instrument).

is_a(clarinet, single_reed_instrument).
is_a(saxophone, single_reed_instrument).
is_a(flute, no_reed_instrument).
is_a(single_reed_instrument, woodwind_instrument).
is_a(no_reed_instrument, woodwind_instrument).
is_a(woodwind_instrument, musical_instrument).

is_a(xylophone, tuned_percussion_instrument).
is_a(marimba, tuned_percussion_instrument).
is_a(drum, untuned_percussion_instrument).
is_a(tuned_percussion_instrument, percussion_instrument).
is_a(untuned_percussion_instrument, percussion_instrument).
is_a(percussion_instrument, musical_instrument).

is_a(musical_instrument, sound_producing_device).

% Part-whole relationships part_of (instrument parts)
part_of(string, guitar).
part_of(fretboard, guitar).
part_of(bow, violin).
part_of(drumstick, drum).
part_of(key, piano).
part_of(hole, flute).
part_of(hammer, piano).
part_of(bell, trumpet).
part_of(mouthpiece, trombone).
part_of(bridge, cello).
part_of(mouthpiece, saxophone).
part_of(reed, saxophone).
part_of(drumhead, drum).

% Transitivity for is_a (If X is_a Y and Y is_a Z, then X is_a Z)
inherits(X, Z) :- is_a(X, Z).
inherits(X, Z) :- is_a(X, Y), inherits(Y, Z).

% Transitivity for part_of, considering the is_a hierarchy
contained_in(X, Z) :- part_of(X, Z).
contained_in(X, Z) :- part_of(X, Y), contained_in(Y, Z).
contained_in(X, Z) :- part_of(X, Y), inherits(Y, Z).

% Initialization predicate to run main queries automatically
:- initialization(main).

main :-
    % Check inheritance
    (inherits(guitar, musical_instrument) ->
        write('Guitar is a musical_instrument'), nl
        ;
        write('Guitar is not a musical_instrument'), nl),

    (inherits(violin, sound_producing_device) ->
        write('Violin is a sound_producing_device'), nl
        ;
        write('Violin is not a sound_producing_device'), nl),

    (inherits(saxophone, musical_instrument) ->
        write('Saxophone is a musical_instrument'), nl
        ;
        write('Saxophone is not a musical_instrument'), nl),

    (inherits(marimba, sound_producing_device) ->
        write('Marimba is a sound_producing_device'), nl
        ;
        write('Marimba is not a sound_producing_device'), nl),

    (inherits(drum, string_instrument) ->
        write('Drum is a string_instrument'), nl
        ;
        write('Drum is not a string_instrument'), nl),  % Expected to be false

    (inherits(flute, brass_instrument) ->
        write('Flute is a brass_instrument'), nl
        ;
        write('Flute is not a brass_instrument'), nl),  % Expected to be false

    % Check part_of relationships
    (contained_in(string, musical_instrument) ->
        write('String is part_of musical_instrument'), nl
        ;
        write('String is not part_of musical_instrument'), nl),

    (contained_in(bow, string_instrument) ->
        write('Bow is part_of string_instrument'), nl
        ;
        write('Bow is not part_of string_instrument'), nl),

    (contained_in(hammer, sound_producing_device) ->
        write('Hammer is part_of sound_producing_device'), nl
        ;
        write('Hammer is not part_of sound_producing_device'), nl),

    (contained_in(drumstick, brass_instrument) ->
        write('Drumstick is part_of brass_instrument'), nl
        ;
        write('Drumstick is not part_of brass_instrument'), nl),  % Expected to be false

    (contained_in(reed, piano) ->
        write('Reed is part_of piano'), nl
        ;
        write('Reed is not part_of piano'), nl),  % Expected to be false

    % End program
    halt.
