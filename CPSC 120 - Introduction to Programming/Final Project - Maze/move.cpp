//void goLeft(int &x,int &y)
//{  if ((maze[x][y-1]==' '||maze[x][y-1]=='-'||maze[x][y-1]=='|')&& (y-1>0||y-1==0))
//	{  if (maze[x][y-1]==' ')
//	   maze[x][y-1]='-';
//	     system("CLS");
//         printmaze(9);
//	     y=y-1;
//	}
//else
//{
//	cout<<"invalid move!";
//	maxtrial+=1;
//}
//}
//void goRight(int &x,int &y)
//{  if ((maze[x][y+1]==' ' || maze[x][y+1]=='-'|| maze[x][y+1]=='|')&& (y+1<19||y+1==19))
//         {   if (maze[x][y+1]==' ')
//			 maze[x][y+1]='-';
//		      system("CLS");
//              printmaze(9);
//			  y=y+1;
//
//         }
//    else
//	{
//	cout<<"invalid move!";
//	maxtrial+=1;
//    }
//
//}
//void goUp(int &x,int &y)
//{
//if ((maze[x-1][y]==' '||maze[x-1][y]=='|'||maze[x-1][y]=='-') && (x-1>0||x-1==0))
//          { if (maze[x-1][y]==' ')
//			  maze[x-1][y]='|';
//			   system("CLS");
//              printmaze(9);
//			  x=x-1;
//          }
//else
//{
//	cout<<"invalid move!";
//	maxtrial+=1;
//}
//}
//void goDown(int &x,int &y)
//{if ((maze[x+1][y]==' '||maze[x+1][y]=='|'||maze[x+1][y]=='-')&& (x+1==22||x+1<22))
//          { if (maze[x+1][y]==' ')
//			  maze[x+1][y]='|';
//			    system("CLS");
//                printmaze(9);
//			  x=x+1;
//          }
//else
//{
//	cout<<"invalid move!";
//	maxtrial+=1;
//}