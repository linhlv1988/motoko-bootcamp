import type { Principal } from '@dfinity/principal';
export interface Animal { 'enery' : bigint, 'specie' : string }
export interface TextLabel {
  'labeled' : boolean,
  'text' : string,
  'senti' : string,
}
export interface _SERVICE {
  'check_get' : (arg_0: bigint) => Promise<[] | [Animal]>,
  'check_is_null' : () => Promise<boolean>,
  'check_last' : () => Promise<[] | [Animal]>,
  'check_reverse' : () => Promise<Array<Animal>>,
  'check_size' : () => Promise<bigint>,
  'create_animal_then_takes_a_break' : (
      arg_0: string,
      arg_1: bigint,
    ) => Promise<Animal>,
  'fun' : () => Promise<TextLabel>,
  'get_animals' : () => Promise<Array<Animal>>,
  'push_animal' : (arg_0: Animal) => Promise<undefined>,
}
