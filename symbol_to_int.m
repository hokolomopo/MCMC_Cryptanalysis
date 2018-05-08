function result = symbol_to_int(symbol)
%Transform a symbol from the imposed aplhabet into int

symb = 'abcdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';
size_symb = size(symb);
result = -1;
for i = 1:size_symb(2)
    if(symbol == symb(i))
        result = i;
        break;
    end
end
end