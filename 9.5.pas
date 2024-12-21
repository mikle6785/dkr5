program ArrayManipulation;

const
  MAX_SIZE = 100;

type
  TIntegerArray = array[1..MAX_SIZE] of Integer;

var
  arr1, arr2: TIntegerArray; // глобальные переменные (массивы)
  size1, size2: Integer;  // глобальные переменные (размеры массивов)
  i, j: Integer; // глобальные переменные (счетчики)

// Процедура для ввода массива
procedure InputArray(var arr: TIntegerArray; var size: Integer; arrayName: string);
  // arr - формальный параметр (массив), передается по ссылке
  // size - формальный параметр (размер), передается по ссылке
  // arrayName - формальный параметр (имя массива), передается по значению
var
  i: Integer; // локальная переменная
begin
  Write('Введите размер ' + arrayName + ' массива: ');
  ReadLn(size);
  WriteLn('Введите элементы ' + arrayName + ' массива:');
  for i := 1 to size do
  begin
    Read(arr[i]);
  end;
end;

// Процедура для поиска первого кратного 5 элемента
function FindFirstMultipleOfFive(arr: TIntegerArray; size: Integer): Integer;
  // arr - формальный параметр (массив), передается по значению
  // size - формальный параметр (размер), передается по значению
var
  i: Integer; // локальная переменная
begin
  for i := 1 to size do
    if arr[i] mod 5 = 0 then
    begin
      Result := i;
      Exit;
    end;
  Result := -1; // Если не найден кратный 5 элемент
end;

// Процедура для обработки первого массива (замена максимального на 0)
procedure ProcessArray1(var arr: TIntegerArray; size: Integer);
  // arr - формальный параметр (массив), передается по ссылке
  // size - формальный параметр (размер), передается по значению
var
  maxIndex, i: Integer; // локальные переменные
begin
  maxIndex := 1;
  for i := 2 to size do
    if arr[i] > arr[maxIndex] then
      maxIndex := i;
  arr[maxIndex] := 0;
end;

// Процедура для обработки второго массива (умножение на 2 после минимального)
procedure ProcessArray2(var arr: TIntegerArray; size: Integer);
  // arr - формальный параметр (массив), передается по ссылке
  // size - формальный параметр (размер), передается по значению
var
  minIndex, i: Integer; // локальные переменные
begin
  minIndex := 1;
  for i := 2 to size do
    if arr[i] < arr[minIndex] then
      minIndex := i;
  for i := minIndex + 1 to size do
    arr[i] := arr[i] * 2;
end;

// Процедура для вывода массива
procedure PrintArray(arr: TIntegerArray; size: Integer; arrayName: string);
  // arr - формальный параметр (массив), передается по значению
  // size - формальный параметр (размер), передается по значению
  // arrayName - формальный параметр (имя массива), передается по значению
var
  i: Integer; // локальная переменная
begin
  Write(arrayName + ' массив после обработки: ');
  for i := 1 to size do
    Write(arr[i], ' ');
  WriteLn;
end;

begin
  // Ввод первого массива
  InputArray(arr1, size1, 'первого'); // arr1, size1, 'первого' - фактические параметры

  // Ввод второго массива
  InputArray(arr2, size2, 'второго'); // arr2, size2, 'второго' - фактические параметры

  // Поиск первого кратного 5 элемента в каждом массиве
  var index1 := FindFirstMultipleOfFive(arr1, size1);  // arr1, size1 - фактические параметры
  var index2 := FindFirstMultipleOfFive(arr2, size2); // arr2, size2 - фактические параметры
  
  // Определение, какой массив обрабатывать первым
  if (index1 <> -1) and ((index2 = -1) or (index1 < index2)) then
  begin
    // Если кратный 5 элемент в первом массиве раньше
    ProcessArray1(arr1, size1); // arr1, size1 - фактические параметры
    ProcessArray2(arr2, size2); // arr2, size2 - фактические параметры
  end
  else if (index2 <> -1) then 
  begin
    // Если кратный 5 элемент во втором массиве раньше или его нет в первом
    ProcessArray2(arr1, size1); // arr1, size1 - фактические параметры
    ProcessArray1(arr2, size2); // arr2, size2 - фактические параметры
  end
  else
  begin
      ProcessArray2(arr1, size1); // arr1, size1 - фактические параметры
      ProcessArray2(arr2, size2); // arr2, size2 - фактические параметры
      
  end;
  

  // Вывод результатов
  PrintArray(arr1, size1, 'Первый'); // arr1, size1, 'Первый' - фактические параметры
  PrintArray(arr2, size2, 'Второй'); // arr2, size2, 'Второй' - фактические параметры

end.