%% @author gaston and shiraz
%% @doc @todo Add description to serverclient.


-module(servert).

%% ====================================================================
%% API functions
%% ====================================================================
-export([start/0,server/0]).



%% ====================================================================
%% Internal functions
%% ====================================================================

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
				  timer:sleep(rand:uniform(10)),

     			  server() 	



	end.


%% this is another example  that we try
%% client(Server_Address) -> 
%% 	  statistics(runtime), 
%%   	 statistics(wall_clock), 
%% 
%% %% 	     {_, Time1} = statistics(runtime), 
%%    
%%    
%%   
%% %%    io:format("Process spawn time=~p (~p) microseconds~n" , [U1]),
%% 	receive 
%% 		{hit_count,Number} -> 
%% 		{Time,_}=Number,
%% %% 		U1 =1000/Number,
%% 		io:format("CLIENT ~w: Hit count was ~p~n",[self(),Time/1000]) 
%% 	end.
%% clients(N,Start)when N ==0 ->io:fwrite("~ndone~n");
%% clients(N,Start) when N==3  ->
%% 		Start1 = Start,
%% 		Pid3 = spawn(?MODULE,server,[]),
%% 				Pid3 ! {power, 2,9,self()}, 
%% 				Pid3 ! {log, 150,self()}, 
%% 	Pid3 ! {abs, 670,5000,self()}, 
%% 	Pid3 ! {bul,self()}, 
%% 	Pid3 ! {abs,20,59,self()}, 
%% 	
%% 	End1 = now(),
%% 	Diff1 = timer:now_diff(End1, Start1) / 1000,
%% %% 		U1 =1000/Number,
%% 	io:format("CLIENT3 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff1]) ,%% 		U1 =1000/Number,
%% 			timer:sleep(rand:uniform(100)),
%% 		    clients(N-1,Start1);
%% clients(N,Start) when N==1->
%% 		Start2 = Start,
%% 				  	Pid2 = spawn(?MODULE,server,[]),
%% 				   Pid2 ! {power, 2,5,self()}, 
%% 	Pid2 ! {log, 2,self()}, 
%% 	Pid2 ! {abs, 2,7,self()}, 
%% 	Pid2 ! {bulshit,self()}, 
%% 	Pid2 ! {abs,20,self()}, 
%% 	End2 = now(),
%% Diff2 = timer:now_diff(End2, Start2) / 1000,
%% %% 		U1 =1000/Number,
%% 	io:format("CLIENT ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff2]) ,
%% 					timer:sleep(rand:uniform(100)),
%% 					clients(N-1,Start2);
	
%% clients(N,Start) when N==2 ->
%% 	Start3 = Start,
%% 
%% 				   	Pid1 = spawn(?MODULE,server,[]),
%% 						Pid1 ! {power, 5,100,self()}, 
%% 	Pid1 ! {log, 500,self()}, 
%% 	Pid1 ! {abs, 78,80,self()}, 
%% 	Pid1 ! {bulshit,self()}, 
%% 	Pid1 ! {abs,20,self()}, 
%% 	End3 = now(),
%% Diff3 = timer:now_diff(End3, Start3) / 1000,
%% %% 		U1 =1000/Number,
%% 	io:format("CLIENT2 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff3]) ,
%% 	  timer:sleep(rand:uniform(100)),
%% 					clients(N-1,Start3).
%% 			
		


start() -> 
	 
Start = now(),
			timer:sleep(rand:uniform(100)),

%% 	clients(3,Start),
%% for the first cliant 5 massages

		Start1 = Start,
	  	Pid1 = spawn(?MODULE,server,[]),
		Pid3 = spawn(?MODULE,server,[]),
	  	Pid2 = spawn(?MODULE,server,[]),

				Pid3 ! {power, 2,9,self()}, 
				Pid3 ! {log, 150,self()}, 
	Pid3 ! {abs, 670,5000,self()}, 
	Pid3 ! {bul,self()}, 
	Pid3 ! {abs,20,59,self()}, 
	
	End1 = now(),
	Diff1 = timer:now_diff(End1, Start1) / 1000,
	io:format("CLIENT3 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff1]) ,%% 		U1 =1000/Number,
			timer:sleep(rand:uniform(100)),
%% for the second cliant 5 massages

		Start2 = Start,
	 Pid2 ! {power, 2,5,self()}, 
	Pid2 ! {log, 2,self()}, 
	Pid2 ! {abs, 2,7,self()}, 
	Pid2 ! {bulshit,self()}, 
	Pid2 ! {abs,20,self()}, 
	End2 = now(),
Diff2 = timer:now_diff(End2, Start2) / 1000,
	io:format("CLIENT ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff2]) ,
					timer:sleep(rand:uniform(100)),
%% for the last cliant 5 massages

	Start3 = Start,
	Pid1 ! {power, 5,100,self()}, 
	Pid1 ! {log, 500,self()}, 
	Pid1 ! {abs, 78,80,self()}, 
	Pid1 ! {bulshit,self()}, 
	Pid1 ! {abs,20,self()}, 
	End3 = now(),
	Diff3 = timer:now_diff(End3, Start3) / 1000,
	io:format("CLIENT2 ~w: The operation took: ~p milliseconds~n ~n",[self(),Diff3]) ,
	  timer:sleep(rand:uniform(100)),

				 
End = now(),
Diff = timer:now_diff(End, Start) / 1000,
io:format("The operation took: ~p milliseconds~n", [Diff]).






