function corruptedSeq = corrupt_sequence(seq)

    intSeq = arrayfun(@(x) symbol_to_int(x), seq);
    key = randperm(40);
    intCorruptedSeq = decode (intSeq, key);
    corruptedSeq = arrayfun(@(x) int_to_symbol(x), intCorruptedSeq);
end