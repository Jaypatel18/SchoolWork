module Final(S,Y4, Y3, Y2, Y1, X4, X3,X2,X1);
input S,Y4,Y3,Y2,Y1;
output X4,X3,X2,X1;

assign X4 = (~Y4 & ~Y3 & Y2 & Y1 & ~S) | (~Y4 & Y3 & Y2 & ~Y1 & ~S) | (~Y4 & ~Y3 & ~Y2 & Y1 & S) | (~Y4 & ~Y3 & Y2 & ~Y1 & S);

assign X3 = ((~Y4 & ~Y3 & Y2 & ~Y1 & ~S) | (~Y4 & Y3 & ~Y2 & Y1 & ~S) | (Y4 & ~Y3 & ~Y2 & ~Y1 & ~S) | (Y4 & ~Y3 & ~Y2 & Y1 & ~S) | (~Y4 & ~Y3 & ~Y2 & ~Y1 & S) | (~Y4 & Y3 & Y2 & Y1 & S) | (Y4 & ~Y3 & ~Y2 & ~Y1 & S) | (Y4 & ~Y3 & ~Y2 & Y1 & S));

assign X2 = (~Y4 & ~Y3 & ~Y2 & Y1 & ~S) | (~Y4 & ~Y3 & Y2 & ~Y1 & ~S) | (~Y4 & Y3 & ~Y2 & ~Y1 & ~S) | (Y4 & ~Y3 & ~Y2 & Y1 & ~S) | (~Y4 & ~Y3 & ~Y2 & ~Y1 & S) | (~Y4 & Y3 & ~Y2 & Y1 & S) | (~Y4 & Y3 & Y2 & ~Y1 & S) | (Y4 & ~Y3 & ~Y2 & Y1 & S);

assign X1 = (~Y4 & ~Y3 & ~Y2 & Y1 & ~S) | (~Y4 & ~Y3 & Y2 & Y1 & ~S) | (~Y4 & Y3 & ~Y2 & Y1 & ~S) | (~Y4 & Y3 & Y2 & Y1 & ~S) | (Y4 & ~Y3 & ~Y2 & Y1 & ~S) | (~Y4 & ~Y3 & ~Y2 & ~Y1 & S) | (~Y4 & ~Y3 & Y2 & ~Y1 & S) | (~Y4 & Y3 & ~Y2 & ~Y1 & S) | (~Y4 & Y3 & Y2 & ~Y1 & S) | (Y4 & ~Y3 & ~Y2 & ~Y1 & S);




 endmodule                                           