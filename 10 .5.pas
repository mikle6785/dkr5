program TwoDimensionalArrayWithProcedures;

const
  ROWS = 8;
  COLS = 8;

type
  TMatrix = array[1..ROWS, 1..COLS] of Integer;
  TResultArray = array[1..ROWS] of Integer;

// Процедура для заполнения матрицы случайными числами
procedure FillMatrix(var arr: TMatrix);
var
  i, j: Integer;
begin
  Randomize;
  for i := 1 to ROWS do
    for j := 1 to COLS do
      arr[i, j] := Random(90) + 10; // Генерация числа от 10 до 99
end;

// Процедура для обработки строки и заполнения результирующего массива
procedure ProcessRow(var arr: TMatrix; row: Integer; var result: TResultArray);
var
  maxValue, maxCount, j: Integer;
begin
  maxValue := arr[row, 1];
  maxCount := 1;

  for j := 2 to COLS do
    begin
      if arr[row, j] > maxValue then
      begin
        maxValue := arr[row, j];
        maxCount := 1;
      end
      else if arr[row, j] = maxValue then
        Inc(maxCount);
    end;
    
    if maxCount = 1 then
      result[row] := 1
    else
      result[row] := -1;
end;

// Процедура для вывода матрицы
procedure PrintMatrix(var arr: TMatrix);
var
  i, j: Integer;
begin
  WriteLn('Сгенерированная матрица:');
  for i := 1 to ROWS do
  begin
    for j := 1 to COLS do
      Write(arr[i, j]:4);
    WriteLn;
  end;
end;

// Процедура для вывода одномерного массива
procedure PrintResultArray(var arr: TResultArray);
var
  i: Integer;
begin
  WriteLn('Результирующий одномерный массив:');
  for i := 1 to ROWS do
    Write(arr[i]:4);
  WriteLn;
end;


var
  matrix: TMatrix;
  resultArray: TResultArray;
  i: Integer;

begin
  // Заполнение матрицы
  FillMatrix(matrix);

  // Обработка каждой строки и заполнение результирующего массива
  for i := 1 to ROWS do
    ProcessRow(matrix, i, resultArray);

  // Вывод матрицы
  PrintMatrix(matrix);

  // Вывод результирующего массива
  PrintResultArray(resultArray);
end.