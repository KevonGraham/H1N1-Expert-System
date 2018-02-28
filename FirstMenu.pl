
%Kevon Graham-1304379
%Kevion Foster- 1200119
%Jevon Davis- 1103678



%Generall Flu class.

        
        fluSymptom(Patient,Fever).
        fluSymptom(Patient,Headache).
        fluSymptom(Patient,Body_ache).
        fluSymptom(Patient,Conjunctivitis).
        fluSymptom(Patient,Chills).
        fluSymptom(Patient,Sore_throat).
        fluSymptom(Patient,Runny_nose).
        fluSymptom(Patient,Cough).
        fluSymptom(Patient,Rash).
        fluSymptom(Patient,Sneezing).
        fluSymptom(Patient,Swollen_glands).

        commonSymptom(Patient,headache).
        commonSymptom(Patient,sneezing).
        commonSymptom(Patient,sore_throat).
        commonSymptom(Patient,runny_nose).
        commonSymptom(Patient,chills).

         swineSymptom(Patient,discomfort).


        spanishSymptom(Patient,Resproblem).
    	spanishSymptom(Patient,Aches).

    	russianSymptom(Patient,Pne).

    	northSymptom(Patient,Resproblem).

    	%The below information represents the major symptoms experienced by persons suspected to have the flu.
    	%Certain combinations will determine the type of H1N1 the person has which will direct them to precautionary measures & remedies.

        flu_Symptoms(Patient,Parish):-
        write(Patient),write('From the list below select the symptom you are experinecing mostly by typing y/n'),nl,
			write('1 General Discomfort y/n'),nl,read(Discomfort),nl,
			write('2 Respiratory Problem y/n' ),nl,read(Resproblem),nl,
			write('3 Intense Body Ache y/n'),nl,read(Aches),nl,
			write('4 Pneumonia y/n?'),nl,read(Pne),nl,
			(Discomfort=='y',Aches=='n',Pne=='n',Resproblem=='n'->swine_Symptoms(Patient,Parish);

			Resproblem=='y', Aches=='y',Discomfort=='n' ,Pne=='n'->spanish_Symptoms(Patient,Parish);

			 Resproblem=='n',Discomfort=='n', Pne=='y',Aches=='n'->russian_Symptoms(Patient,Parish);

			 Resproblem=='y',Aches=='n',Pne=='n',Discomfort=='n'->north_Symptoms(Patient,Parish);

			 Resproblem=='y',Aches=='y',Pne=='y',Discomfort=='y'->write('Your symptoms are severe. Please seek immediate medical attention');

			 Resproblem=='n',Aches=='n',Pne=='n',Discomfort=='n'->write('It looks like you have regular Human Flu'),nl,

             write('You may take Asprin medication to help with the recovery with your symptoms. '),nl,
             write('If symptoms persist beyond 3 days, please see a medical Doctor')).
        
    
    %Swine flu class.
    swine_Symptoms(Patient,Parish):-
    
    write(Patient),write(', you have Swine Flu'),nl,nl,
    write('Short term remedy: Isolation for 5 days, Pregnant women seek immediate medical attention,hildren take either acetaminophen or ibuprofen'),nl,
    write('Long Term: vaccination'),
    [Patient,Parish,'Swine_Flu']=[A|B],
     open('Swine_Flu.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),
    welcome.


    %Spanish flu class.
    spanish_Symptoms(Patient,Parish):-
    write(Patient),write(', you have Spanish Flu'),nl,nl,
    write('Short Term: Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen'),nl,
    write('Long Term: vaccination'),
    [Patient,Parish,'Spanish_Flu']=[A|B],
     open('Spanish_Flu.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),nl,nl,
    welcome.
    
    

    %this may be optional for it is general to flu itself but note specificity.
    
    %Russian flu class.
    % “pne” shortening for pneumonia
    russian_Symptoms(Patient, Parish):-
        write(Patient),write(', you have Russian Flu'),nl,nl,
        write('Short Term Remedy:  Pregnant women seek immediate medical attention, childrens take either acetaminophen or ibuprofen'),nl,
        write('Long Term: Vaccination '),
        [Patient,Parish,'Russian_Flu']=[A|B],
     open('Russian_Flu.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),nl,nl,
        welcome.
    
 
    %north American flu class
    north_Symptoms(Patient,Parish):-
    write(Patient),write(', you have A(H1N1) Flu'),nl,nl,
    write('Short Term: Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen'),nl,
    write('Long Term: vaccination'),
    [Patient,Parish,'A(H1N1)']=[A|B],
     open('North_Flu.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),nl,nl,
    welcome.
    

    %Common Cold Class.
        common_Cold(Patient,Parish):-
       write(Patient),write(', you have the common cold'),
       [Patient,Parish,'common_Cold']=[A|B],
     open('common_Cold.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),nl,nl,
       welcome .



        
%Function to Start the Program

welcome:- write('Welcome to H1N1 Expert System'),nl,
			write('Informing you about your health for best protection'),nl,nl,
			write('Please select your option from the below Menu:'),nl,
			write('1 Check Symptoms'),nl,
			write('2 Query System'),nl,
			write('3 Analyze Data'),nl,read(Opt),nl,
			(Opt==1->user; Opt==2->query;nl,write('bye!')).


%User Inputs are collected in the form of biographic data

user:- write('Hello again, could you plaese enter the following details'),nl,nl,
		 write('Name:'),nl,read(Patient),nl,
		 write('Age:'),nl,read(Age),nl,
		 write('Gender'),nl,read(Gender),nl,
		 write('Parish you are from'),nl,read(Parish),nl,
		 write('Body Tempreture in degrees celcius :'),nl,read(Temp),nl,
		 (F_temp is (Temp * 1.8 ) + 32 ),nl,write('Tempreture in Farenheit is,'),write(F_temp),nl,nl,
		 write('Last Travel destination:'),nl,read(Dest),nl,
		 write('Continent traveled to:'),nl,read(Cont),nl,nl,
		 [Patient,Age,Gender,Parish,Temp,F_temp,Dest,Cont] = [A|B],
		 open('Patient_Info.txt',write, Stream),
    (  write(Stream, [A|B]), fail
    ;   true
    ),
    close(Stream),
		 risk(Patient,Parish).
		 	




% In the risk function the Symptoms patients are experienceing are gathered for a final determination of the illness.

risk(Patient,Parish):- write(Patient), write(' ,Select the symptoms you are experiencing'),nl,nl,
write('Do you have a fever (y/n) ?'),nl,read(Fever),nl,
 write(' Do you have a rash (y/n) ?'),nl,read(Rash),nl,
  write(' Do you have a headache (y/n) ?'),nl,read(Headache),nl,
write(' Do have runny nose (y/n) ?'),nl,read(Runny_nose),nl,
    write(' Do you have a cough (y/n) ?'),nl,read(Cough),nl,
    write('Do you have conjunctivitis (y/n) ?'),nl,read(Conjunctivitis),nl,
write('Do you have chills (y/n) ?'),nl,read(Chills),nl,
    write('Do you have bodyache (y/n) ?'),nl,read(Body_ache),nl,
    write('Do you have a sore throat (y/n) ?'),nl,read(Sore_throat),nl,
    write('Are you sneezing (y/n) ?'),nl,read(Sneezing),nl,
    write('Do have a swollen glands (y/n) ?'),nl,read(Swollen_glands),

    (Fever=='y'-> Fev is 1; Fever=='n'->Fev is 0),

    (Rash=='y'-> Ras is 1; Rash=='n'->Ras is 0),

    (Headache=='y'-> Head is 1; Headache=='n'->Head is 0),

    (Runny_nose=='y'-> Run is 1; Runny_nose=='n'->Run is 0),

    (Cough=='y'-> Cou is 1; Cough=='n'->Cou is 0),

    (Conjunctivitis=='y'-> Con  is 1; Conjunctivitis=='n'->Con is 0),

    (Chills=='y'-> Chi is 1; Chills=='n'->Chi is 0),

    (Body_ache=='y'-> Bod is 1; Body_ache=='n'->Bod is 0),

    (Sore_throat=='y'-> Sor is 1; Sore_throat=='n'->Sor is 0),

    (Sneezing=='y'-> Sne is 1; Sneezing=='n'->Sne is 0),

    (Swollen_glands=='y'-> Swo is 1; Swollen_glands=='n'->Swo is 0),

   ( Value is Fev + Ras + Head + Run + Cou + Con + Chi + Bod + Sor + Sne + Swo),
 	
write(Value),nl,

    (Value >= 7 -> flu_Symptoms(Patient,Parish); Value>1,Value<7, Fever=='n'-> common_Cold(Patient,Parish);Value ==0, nl,nl,
     write(Value),nl,write('Your Symptoms are not clear. Please see a physician'),nl,nl,welcome()). 

    
    
%Below function handles the ability to Query the system for details on the flu types. 
%The types are the major ilnesses consider in this system

    query:- write('Welcome to Query System. Select Query options from the list below:'),nl,nl,
		write('1 General Flu Symptoms '),nl,
		write('2 Swine Flu Symptoms' ),nl,
		write('3 Russian Flu Symptoms'),nl,
		write('4 Spanish Flu Symptoms'),nl,
		write('5 A(H1N1) Flu Symptoms'),nl,
		write('6 Common Cold Symptoms'),nl,
		write('7 Back to Main Menu'),nl,
		read(Opt),nl,
		(Opt==1-> write('Symptoms are chills, fever, sore throat, muscle pains, severe headache, coughing, weakness, '),nl,
			write('You may take Asprin medication to help with the recovery with your symptoms. '),nl,
             write('If symptoms persist beyond 3 days, please see a medical Doctor'),nl,nl;

		Opt==2->write('Symptoms:  chills, fever, sore throat, muscle pains, severe headache, coughing, weakness, and general discomfort.
'),nl,write('Short term remedy: Isolation for 5 days, Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen
'),nl,write('Long term: vaccination'),nl,nl;

		Opt==3->write('Symptoms: chills, fever, sore throat, muscle pains, severe headache, coughing, weakness, and general discomfort.
'),nl,write('Short term remedy:  Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen'),nl,
		write('Age group affects most: Children and young Adults(U23)
'),nl,write('Long term: vaccination'),nl, write('Distinction: Pneumonia '),nl,nl;

		Opt==4-> write('Symptoms :headache, aching muscles, especially in your back, arms and legs,fever,chills and sweats,sore throat,dry, persistent cough,weakness,nasal congestion,Respiratory Problems 
'), nl,write('Short term remedy:  Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen
'), write('Long term: vaccination'),nl,write('Age group affects most: Young Adults'),nl,write('Distinction: Respiratory Problems, aching muscles(arms,leg,back)'),nl,nl;

		Opt==5->write('Symptoms are chills, fever, sore throat, muscle pains, severe headache, coughing, weakness, '),nl,
		write('Short term remedy: Isolation for 5 days, Pregnant women seek immediate medical attention, children take either acetaminophen or ibuprofen
'),nl,write('Long term: vaccination'),nl,nl;

		Opt==6-> write('Symptoms: Usual symptoms include nasal congestion, coughing, sneezing, throat irritation, and a low-grade fever.
'),nl,write('Age group affects most: Everyone'),nl,nl;
		Opt==7->welcome;
		Opt<1 ->write('Please select from the given options'); Opt>7->write('Please select from the given options')),query.		


    analytics:-
			write('Please select your option from the below Menu:'),nl,
			write('1 Patient Biography information'),nl,
			write('2 Patient illness Per flu type'),nl,
			write('3 Back to Main Menu'),nl,
			read(Opt),nl,
			(Opt==1->open('Patient_Info.txt', read, Str),
    read_file(Str,Lines),
    close(Str),
    write(Lines),nl,nl; Opt==2->write('Please select flu type to aalyze from the below Menu:'),nl,
			write('1 Swine Flu'),nl,
			write('2 Russian Flu Symptoms'),nl,
		write('3 Spanish Flu Symptoms'),nl,
		write('4 A(H1N1) Flu Symptoms'),nl,
		write('5 Common Cold Symptoms'),nl,
			read(Menu),nl,

			(Menu==1->open('Swine_Flu.txt', read, Str),
    read_file(Str,[A|B]),
    close(Str),
    write([A|B]),nl,nl;Menu==2->open('Russian_Flu.txt', read, Str),
    read_file(Str,[A|B]),
    close(Str),
    write([A|B]),nl,nl;Menu==3->open('Spanish_Flu.txt', read, Str),
    read_file(Str,[A|B]),
    close(Str),
    write([A|B]),nl,nl;Menu==4->open('North_Flu.txt', read, Str),
    read_file(Str,[A|B]),
    close(Str),
    write([A|B]),nl,nl;Menu==5->open('common_Cold.txt', read, Str),
    read_file(Str,[A|B]),
    close(Str),
    write([A|B]),nl,nl; write('Invalid Entry'),nl,analytics); Opt==3->welcome),
    nl.


