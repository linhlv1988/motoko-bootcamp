export const idlFactory = ({ IDL }) => {
  const Animal = IDL.Record({ 'enery' : IDL.Nat, 'specie' : IDL.Text });
  const TextLabel = IDL.Record({
    'labeled' : IDL.Bool,
    'text' : IDL.Text,
    'senti' : IDL.Text,
  });
  return IDL.Service({
    'check_get' : IDL.Func([IDL.Nat], [IDL.Opt(Animal)], []),
    'check_is_null' : IDL.Func([], [IDL.Bool], []),
    'check_last' : IDL.Func([], [IDL.Opt(Animal)], []),
    'check_reverse' : IDL.Func([], [IDL.Vec(Animal)], []),
    'check_size' : IDL.Func([], [IDL.Nat], []),
    'create_animal_then_takes_a_break' : IDL.Func(
        [IDL.Text, IDL.Nat],
        [Animal],
        [],
      ),
    'fun' : IDL.Func([], [TextLabel], []),
    'get_animals' : IDL.Func([], [IDL.Vec(Animal)], []),
    'push_animal' : IDL.Func([Animal], [], []),
  });
};
export const init = ({ IDL }) => { return []; };
