function varargout = GuessTheX(varargin)
    clc
    % GUESSTHEX MATLAB code for GuessTheX.fig
    %      GUESSTHEX, by itself, creates a new GUESSTHEX or raises the existing
    %      singleton*.
    %
    %      H = GUESSTHEX returns the handle to a new GUESSTHEX or the handle to
    %      the existing singleton*.
    %
    %      GUESSTHEX('CALLBACK',hObject,eventData,handles,...) calls the local
    %      function named CALLBACK in GUESSTHEX.M with the given input arguments.
    %
    %      GUESSTHEX('Property','Value',...) creates a new GUESSTHEX or raises the
    %      existing singleton*.  Starting from the left, property value pairs are
    %      applied to the GUI before GuessTheX_OpeningFcn gets called.  An
    %      unrecognized property name or invalid value makes property application
    %      stop.  All inputs are passed to GuessTheX_OpeningFcn via varargin.
    %
    %      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
    %      instance to run (singleton)".
    %
    % See also: GUIDE, GUIDATA, GUIHANDLES
    
    % Edit the above text to modify the response to help GuessTheX
    
    % Last Modified by GUIDE v2.5 07-Apr-2016 00:01:37
    
    % Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @GuessTheX_OpeningFcn, ...
        'gui_OutputFcn',  @GuessTheX_OutputFcn, ...
        'gui_LayoutFcn',  [] , ...
        'gui_Callback',   []);
    if nargin && ischar(varargin{1})
        gui_State.gui_Callback = str2func(varargin{1});
    end
    
    if nargout
        [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
    else
        gui_mainfcn(gui_State, varargin{:});
    end
    % End initialization code - DO NOT EDIT
    
    
    
    % --- Executes just before GuessTheX is made visible.
function GuessTheX_OpeningFcn(hObject, eventdata, handles, varargin)
    % This function has no output args, see OutputFcn.
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % varargin   command line arguments to GuessTheX (see VARARGIN)
    % Choose default command line output for GuessTheX
    handles.output = hObject;
    
    % Update handles structure
    guidata(hObject, handles);
    
    % UIWAIT makes GuessTheX wait for user response (see UIRESUME)
    % uiwait(handles.figure1);
    
    
    
    % --- Outputs from this function are returned to the command line.
function varargout = GuessTheX_OutputFcn(hObject, eventdata, handles)
    % varargout  cell array for returning output args (see VARARGOUT);
    % hObject    handle to figure
    % eventdata  reserved - to be defined in a future version of MATLAB
    % handles    structure with handles and user data (see GUIDATA)
    % Get default command line output from handles structure
    varargout{1} = handles.output;
    
    
    
    % --- Executes on button press in 'New Game'.
function newgame_Callback(hObject, eventdata, handles)
    % define global variables
    global menu;
    global level;
    global attempts;
    global guessed;
    global name;
    attempts=0; % set no. of attempts to zero
    guessed=0; % set no. of correct guesses to zero
    menu = [handles.newgame, handles.loadscore, handles.instructions];
    set(menu,'visible','off') % make the main menu invisible
    level = [handles.level, handles.lvl1, handles.lvl2, handles.lvl3];
    set(level,'visible','on') % make the level selection menu visible
    name = inputdlg('Enter your name: ',...
        'Player Name', [1 50]); % prompt user to input his/her name
    % END 'NEW GAME' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Load Score'.
function loadscore_Callback(hObject, eventdata, handles)
    disp('Highest Score Info: ') % display info header
    Achieved_by = load('score.mat','h_name') % load and display highest scorer's name
    Attempts = load('score.mat','h_attempts') % load and display highest scorer's no. of attempts
    Correct_Guesses = load('score.mat','h_guessed') % load and display highest scorer's no. of correct guesses
    % END 'LOAD SCORE' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Instructions'.
function instructions_Callback(hObject, eventdata, handles)
    disp('* GuessTheX is an innovative game created by Anas Almasri')
    disp('* ''Load Score'' displays the highest scorer''s name, attempts')
    disp('and correct guesses on the command window.')
    disp('* ''New Game'' button starts a new game by asking the player to')
    disp('enter his/her name and choose the desired level among three')
    disp('available levels; Easy, Intermediate and Difficult.')
    disp('* The game consists of 25 boxes (5x5 table) and the Xs lie')
    disp('behind those boxes. The player must check one box at a time and')
    disp('click ''GO!'' afterwards to see the result of his/her selection.')
    disp('* Selecting more than one box will cause the player to lose his/her')
    disp('current score. The game will be stopped and the Player will be')
    disp('asked to click ''Play Again'' to restart the game.')
    disp('* Differences between the three levels are as follows:')
    disp('- Easy Mode: 5 Xs & 5 Attempts.')
    disp('- Intermediate Mode: 3 Xs & 3 Attempts.')
    disp('- Difficult Mode: 1 X & 1 Attempt.')
    disp('* When the number of attempts is up, the player will be notified and given')
    disp('the choice to see the results of his/her whole game in the command window')
    disp('(''View Results'') or restart the game (''Play Again'').')
    disp('***************')
    disp('Hope I was able to satisfy your expectations with this game.')
    disp('Have fun!')
    % END 'INSTRUCTIONS' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Easy'.
function lvl1_Callback(hObject, eventdata, handles)
    % define global variables
    global lvl1;
    global lvl2;
    global lvl3;
    global level;
    global playspace;
    global X;
    
    % set other levels' values to zero
    lvl2 = 0;
    lvl3 = 0;
    
    lvl1 = get(handles.lvl1,'value'); % get value of chosen level
    set(level,'visible','off') % make level selection menu invisible
    
    % make playspace visible
    playspace = [handles.text1, handles.text2, handles.text3, handles.table, handles.go,...
        handles.AA, handles.AB, handles.AC, handles.AD, handles.AE,...
        handles.BA, handles.BB, handles.BC, handles.BD, handles.BE,...
        handles.CA, handles.CB, handles.CC, handles.CD, handles.CE,...
        handles.DA, handles.DB, handles.DC, handles.DD, handles.DE,...
        handles.EA, handles.EB, handles.EC, handles.ED, handles.EE];
    set(playspace,'visible','on')
    
    % create a matrix consisting of 25 elements, 5 of them are ones
    n = 25;
    nX = 5;
    v = zeros(n,1);
    v(1:nX,1) = 1;
    X = reshape(v(randperm(n)),5,5); % reshape the ones to be in random positions
    % END 'LEVEL 1 [EASY]' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Intermediate'.
function lvl2_Callback(hObject, eventdata, handles)
    % define global variables
    global lvl1;
    global lvl2;
    global lvl3;
    global level;
    global playspace;
    global X;
    
    % set other levels' values to zero
    lvl1 = 0;
    lvl3 = 0;
    
    lvl2 = get(handles.lvl2,'value'); % get value of chosen level
    set(level,'visible','off') % make level selection menu invisible
    
    % make playspace visible
    playspace = [handles.text1, handles.text2, handles.text3, handles.table, handles.go,...
        handles.AA, handles.AB, handles.AC, handles.AD, handles.AE,...
        handles.BA, handles.BB, handles.BC, handles.BD, handles.BE,...
        handles.CA, handles.CB, handles.CC, handles.CD, handles.CE,...
        handles.DA, handles.DB, handles.DC, handles.DD, handles.DE,...
        handles.EA, handles.EB, handles.EC, handles.ED, handles.EE];
    set(playspace,'visible','on')
    
    % create a matrix consisting of 25 elements, 3 of them are ones
    n = 25;
    nX = 3;
    v = zeros(n,1);
    v(1:nX,1) = 1;
    X = reshape(v(randperm(n)),5,5); % reshape the ones to be in random positions
    % END 'LEVEL 2 [INTERMEDIATE]' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Difficult'.
function lvl3_Callback(hObject, eventdata, handles)
    % define global variables
    global lvl1;
    global lvl2;
    global lvl3;
    global level;
    global playspace;
    global X;
    
    % set other levels' values to zero
    lvl1 = 0;
    lvl2 = 0;
    
    lvl3 = get(handles.lvl3,'value'); % get value of chosen level
    set(level,'visible','off') % make level selection menu invisible
    
    % make playspace visible
    playspace  = [handles.text1, handles.text2, handles.text3, handles.table, handles.go,...
        handles.AA, handles.AB, handles.AC, handles.AD, handles.AE,...
        handles.BA, handles.BB, handles.BC, handles.BD, handles.BE,...
        handles.CA, handles.CB, handles.CC, handles.CD, handles.CE,...
        handles.DA, handles.DB, handles.DC, handles.DD, handles.DE,...
        handles.EA, handles.EB, handles.EC, handles.ED, handles.EE];
    set(playspace,'visible','on')
    
    % create a matrix consisting of 25 elements, 1 of them is a one
    n = 25;
    nX = 1;
    v = zeros(n,1);
    v(1:nX,1) = 1;
    X = reshape(v(randperm(n)),5,5); % reshape the one to be in a random position
    % END 'LEVEL 3 [DIFFICULT]' CALLBACK FUNCTION
    
    
    
    % Initialize functions of the 25 checkboxes
function AA_Callback(hObject, eventdata, handles)
function AB_Callback(hObject, eventdata, handles)
function AC_Callback(hObject, eventdata, handles)
function AD_Callback(hObject, eventdata, handles)
function AE_Callback(hObject, eventdata, handles)
function BA_Callback(hObject, eventdata, handles)
function BB_Callback(hObject, eventdata, handles)
function BC_Callback(hObject, eventdata, handles)
function BD_Callback(hObject, eventdata, handles)
function BE_Callback(hObject, eventdata, handles)
function CA_Callback(hObject, eventdata, handles)
function CB_Callback(hObject, eventdata, handles)
function CC_Callback(hObject, eventdata, handles)
function CD_Callback(hObject, eventdata, handles)
function CE_Callback(hObject, eventdata, handles)
function DA_Callback(hObject, eventdata, handles)
function DB_Callback(hObject, eventdata, handles)
function DC_Callback(hObject, eventdata, handles)
function DD_Callback(hObject, eventdata, handles)
function DE_Callback(hObject, eventdata, handles)
function EA_Callback(hObject, eventdata, handles)
function EB_Callback(hObject, eventdata, handles)
function EC_Callback(hObject, eventdata, handles)
function ED_Callback(hObject, eventdata, handles)
function EE_Callback(hObject, eventdata, handles)
    
    
    
    % --- Executes on button press in 'GO'.
function go_Callback(hObject, eventdata, handles)
    % define global variables
    global playspace;
    global X;
    global checked;
    global lvl1;
    global lvl2;
    global lvl3;
    global attempts;
    global guessed;
    global name;
    
    attempts=attempts+1; % increment attempts by one
    correct_answer=0; % set correct_answer to zero
    
    % create a 5x5 matrix that consists of checkboxes values
    checked = [get(handles.AA,'value'), get(handles.AB,'value'), get(handles.AC,'value'), get(handles.AD,'value'), get(handles.AE,'value');...
        get(handles.BA,'value'), get(handles.BB,'value'), get(handles.BC,'value'), get(handles.BD,'value'), get(handles.BE,'value');...
        get(handles.CA,'value'), get(handles.CB,'value'), get(handles.CC,'value'), get(handles.CD,'value'), get(handles.CE,'value');...
        get(handles.DA,'value'), get(handles.DB,'value'), get(handles.DC,'value'), get(handles.DD,'value'), get(handles.DE,'value');...
        get(handles.EA,'value'), get(handles.EB,'value'), get(handles.EC,'value'), get(handles.ED,'value'), get(handles.EE,'value')];
    
    % loop to check whether an X lies behind one of the checked boxes
    for i=1:5 % loop rows
        for j=1:5 % loop columns
            % if an X is in the same cell, set correct_answer to one
            if X(i,j)==1 && checked(i,j)==1
                correct_answer=1;
            end % endif statement
        end % end columns for loop
    end % end rows for loop
    
    % check if the user checked more than one checkbox
    if sum(checked(:))>1
        % make all objects invisible
        set(handles.correct,'visible','off')
        set(handles.incorrect,'visible','off')
        set(handles.nextattempt,'visible','off')
        set(playspace,'visible','off')
        
        set(handles.morethan1,'visible','on') % notify user that they checked more than one box
        set(handles.playagain,'visible','on') % make 'Play Again' button visible
    end % endif statement
    
    % check whether user guessed the X or not
    if correct_answer==1 % if user was able to guess the X
        guessed = guessed+1; % increment no. of guesses
        set(playspace,'visible','off') % make playspace invisible
        set(handles.correct,'visible','on') % congratualte the user
        set(handles.nextattempt,'visible','on') % make 'Next Attempt' button visible
    elseif correct_answer==0 % if user was not able to guess the X
        % make all objects invisible
        set(handles.morethan1,'visible','off')
        set(playspace,'visible','off')
        set(handles.incorrect,'visible','on') % tell the user that they didn't guess the X correctly
        set(handles.nextattempt,'visible','on') % make 'Next Attempt' button visible
    end % endif statement
    
    % check if no. of attempts is up
    if attempts==5
        if lvl1==1
            % if no. of attempts for Easy mode is up
            set(handles.nextattempt,'visible','off') % make 'Next Attempt' button invisible
            set(handles.exceeded,'visible','on') % tell user that no. of attempts is up
            set(handles.playagain,'visible','on') % make 'Play Again' button visible
            set(handles.report,'visible','on') % make 'View Results' button visible
            
            % check if player's score is higher than saved highscore
            load('score.mat','h_guessed') % load no. of guessed from score.mat
            if guessed>h_guessed % if player's guesses are more than highscore guesses
                % set values of player's score to highscore variables
                h_name = name;
                h_attempts = attempts;
                h_guessed = guessed;
                save('score.mat','h_name','h_attempts','h_guessed') % save variables in score.mat
            end % endif statement
        end % endif statement
    elseif attempts==3
        if lvl2==1
            % if no. of attempts for Intermediate mode is up
            set(handles.nextattempt,'visible','off') % make 'Next Attempt' button invisible
            set(handles.exceeded,'visible','on') % tell user that no. of attempts is up
            set(handles.playagain,'visible','on') % make 'Play Again' button visible
            set(handles.report,'visible','on') % make 'View Results' button visible
            
            % check if player's score is higher than saved highscore
            load('score.mat','h_guessed') % load no. of guessed from score.mat
            if guessed>h_guessed % if player's guesses are more than highscore guesses
                % set values of player's score to highscore variables
                h_name = name;
                h_attempts = attempts;
                h_guessed = guessed;
                save('score.mat','h_name','h_attempts','h_guessed') % save variables in score.mat
            end % endif statement
        end % endif statement
    elseif attempts==1
        if lvl3==1
            % if no. of attempts for Difficult mode is up
            set(handles.nextattempt,'visible','off') % make 'Next Attempt' button invisible
            set(handles.exceeded,'visible','on') % tell user that no. of attempts is up
            set(handles.playagain,'visible','on') % make 'Play Again' button visible
            set(handles.report,'visible','on') % make 'View Results' button visible
            
            % check if player's score is higher than saved highscore
            load('score.mat','h_guessed') % load no. of guessed from score.mat
            if guessed>h_guessed % if player's guesses are more than highscore guesses
                % set values of player's score to highscore variables
                h_name = name;
                h_attempts = attempts;
                h_guessed = guessed;
                save('score.mat','h_name','h_attempts','h_guessed') % save variables in score.mat
            end % endif statement
        end % endif statement
    end % endif statement
    
    % loop to make matrix of checked boxes consist of zeros
    for x=1:5 % loop rows
        for y=1:5 % loop columns
            checked(x,y)=0; % set element to zero
        end % end inner for loop
    end % end outer for loop
    % END 'GO!' CALLBACK FUNCTION
    
   
    
    % --- Executes on button press in 'Play Again'.
function playagain_Callback(hObject, eventdata, handles)
    % restart GUI execution
    close(gcbf)
    GuessTheX
    % END 'PLAY AGAIN' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'Next Attempt'.
function nextattempt_Callback(hObject, eventdata, handles)
    % define global variables
    global playspace;
    global checked;
    
    % uncheck all check boxes by setting their values to zero
    set(handles.AA,'value',0), set(handles.AB,'value',0), set(handles.AC,'value',0), set(handles.AD,'value',0), set(handles.AE,'value',0),
    set(handles.BA,'value',0), set(handles.BB,'value',0), set(handles.BC,'value',0), set(handles.BD,'value',0), set(handles.BE,'value',0),
    set(handles.CA,'value',0), set(handles.CB,'value',0), set(handles.CC,'value',0), set(handles.CD,'value',0), set(handles.CE,'value',0),
    set(handles.DA,'value',0), set(handles.DB,'value',0), set(handles.DC,'value',0), set(handles.DD,'value',0), set(handles.DE,'value',0),
    set(handles.EA,'value',0), set(handles.EB,'value',0), set(handles.EC,'value',0), set(handles.ED,'value',0), set(handles.EE,'value',0)
    
    % display playspace and make other objects invisible
    set(handles.nextattempt,'visible','off')
    set(handles.incorrect,'visible','off')
    set(handles.correct,'visible','off')
    set(playspace,'visible','on')
    
    % loop to make matrix of checked boxes consist of zeros
    for a=1:5 % loop rows
        for b=1:5 % loop columns
            checked(a,b)=0; % set element value to zero
        end % end inner for loop
    end % end outer for loop
    % END 'NEXT ATTEMPT' CALLBACK FUNCTION
    
    
    
    % --- Executes on button press in 'View Results'.
function report_Callback(hObject, eventdata, handles)
    % define global variables
    global lvl1;
    global lvl2;
    global lvl3;
    global guessed;
    global attempts;
    
    % determine user's results and display them
    if lvl1==1 % if chosen level is Easy
        if guessed==0 % if user didn't guess the X's position
            if attempts>=5 % if no. of attempts was up
                fprintf('You weren''t able to guess the X''s place correctly in 5 attempt(s) [Easy Mode]\n')
            else % elseif no. of attempts wasn't up
                fprintf('You weren''t able to guess the X''s place correctly in %d attempt(s) [Easy Mode]\n',attempts)
            end %endif statement
        elseif guessed~=0 % if user was able to guess the X's position
            if attempts>=5 % if no. of attempts was up
                fprintf('You were able to guess the X''s place correctly %d time(s) in 5 attempt(s) [Easy Mode]\n',guessed)
            else % elseif no. of attempts wasn't up
                fprintf('You were able to guess the X''s place correctly %d time(s) in %d attempt(s) [Easy Mode]\n',guessed,attempts)
            end % endif statement
        end % endif statement
    elseif lvl2==1 % if chosen level is Intermediate
        if guessed==0 % if user didn't guess the X's position
            if attempts>=3 % if no. of attempts was up
                fprintf('You weren''t able to guess the X''s place correctly in 3 attempt(s) [Intermediate Mode]\n')
            else % elseif no. of attempts wasn't up
                fprintf('You weren''t able to guess the X''s place correctly in %d attempt(s) [Intermediate Mode]\n',attempts)
            end%endif statement
        elseif guessed~=0 % if user was able to guess the X's position
            if attempts>=3 % if no. of attempts was up
                fprintf('You were able to guess the X''s place correctly %d time(s) in 3 attempt(s) [Intermediate Mode]\n',guessed)
            else % elseif no. of attempts wasn't up
                fprintf('You were able to guess the X''s place correctly %d time(s) in %d attempt(s) [Intermediate Mode]\n',guessed,attempts)
            end % endif statement
        end % endif statement
    elseif lvl3==1 % if chosen level is Difficult
        if guessed==0 % if user didn't guess the X's position
            fprintf('You weren''t able to guess the X''s place correctly in 1 attempt [Difficult Mode]\n')
        elseif guessed~=0 % if user was able to guess the X's position
            fprintf('You were able to guess the X''s place correctly 1 time in 1 attempt! [Difficult Mode]\n')
        end % endif statement
    end % endif statement
    % END 'VIEW RESULTS' CALLBACK FUNCTION
% END OF PROGRAM