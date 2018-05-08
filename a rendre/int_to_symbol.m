function result = int_to_symbol(int)
%Transform a int from 1:40 into a symbol

symb = 'abcdefghijklmnopqrstuvwxyz,.''"-!?:;()[] ';

result = symb(int);

end