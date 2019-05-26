%% @author gaston and shiraz
%% @doc @todo Add description to serverclient.


-module(serverclient).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,server/0]).



%% ====================================================================
%% Internal function
%% ====================================================================


%% the server 
 server() -> 

	
	receive  {power,X,Y,Return_PID} -> 
				 				 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:pow(X, Y)] ) , 

						 timer:sleep(1),
					server( );
			
			{abs,X,Y,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,abs(X -Y)] ) , 

 				timer:sleep(2),

				 server( ) ;
				 				
			{log,X,Return_PID} -> 

				 io:format("SERVER ~w: Client request received from ~w~n~p~n", 
						   	
						    [self(), Return_PID,math:log(X)] ) , 

				 timer:sleep(3),
				 server() ;
			 Other ->
    			  io:fwrite("enter a wrong arguments"), 
				  timer:sleep(10),
     			  server() 	



	end.

%%start the cliant and massages 
start() -> 
Start = now(),
	Pid2 = spawn(?MODULE,server,[]),
	Pid2 ! {power, 2,5,self()}, 
	Pid2 ! {log, 2,self()}, 
	Pid2 ! {abs, 2,7,self()}, 
	Pid2 ! {bulshit,self()}, 
	Pid2 ! {abs,20,self()}, 
	Pid2 ! {power, 5,5,self()}, 
	Pid2 ! {log, 50,self()}, 
	Pid2 ! {power, 2,self()}, 
	Pid2 ! {log,170,self()}, 
	Pid2 ! {abs,5,7000,self()}, 
	Pid2 ! {power, 2,5,self()}, 
	Pid2 ! {log, 2,self()}, 
	Pid2 ! {abs, 2,7,self()}, 
	Pid2 ! {bulshit,self()}, 
	Pid2 ! {abs,20,self()}, 
	Pid2 ! {power, 10,5,self()}, 
	Pid2 ! {log, 2000,self()}, 
	Pid2 ! {power, 80,5,self()}, 
	Pid2 ! {log,100,self()}, 
	Pid2 ! {bulshit,20,750,self()},

%% 		U1 =1000/Number,
		io:format("CLIENT ~w: Hit count was ~p~n",[self()]) ,
End = now(),
%% time differance  	  
Diff = timer:now_diff(End, Start) / 1000,
io:format("The operation took: ~p milliseconds~n", [Diff]).


	



