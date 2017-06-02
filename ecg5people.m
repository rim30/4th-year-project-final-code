sampleskept=20000;
nobeats=5;

[tm1,signal1,lead11,Fs1,labels1,t1]=loadECG('16265m');
person1=lead11(1:sampleskept);
person1=filterECG(person1,2,1,40,128);
beats1=SplitECG(person1,nobeats);

[tm2,signal2,lead12,Fs2,labels2,t2]=loadECG('16272m');
person2=lead12(1:sampleskept);
person2=filterECG(person2,2,1,40,128);
beats2=SplitECG(person2,nobeats);

[tm3,signal3,lead13,Fs3,labels3,t3]=loadECG('16273m');
person3=lead13(1:sampleskept);
person3=filterECG(person3,2,1,40,128);
beats3=SplitECG(person3,nobeats);

[tm4,signal4,lead14,Fs4,labels4,t4]=loadECG('16420m');
person4=lead14(1:sampleskept);
person4=filterECG(person4,2,1,40,128);
beats4=SplitECG(person4,nobeats);

[tm5,signal5,lead15,Fs5,labels5,t5]=loadECG('16483m');
person5=lead15(1:sampleskept);
person5=filterECG(person5,2,1,40,128);
beats5=SplitECG(person5,nobeats);

[tm6,signal6,lead16,Fs6,labels6,t6]=loadECG('16539m');
person6=lead16(1:sampleskept);
person6=filterECG(person6,2,1,40,128);
beats6=SplitECG(person6,nobeats);

[tm7,signal7,lead17,Fs7,labels7,t7]=loadECG('16773m');
person7=lead17(1:sampleskept);
person7=filterECG(person7,2,1,40,128);
beats7=SplitECG(person7,nobeats);

[tm8,signal8,lead18,Fs8,labels8,t8]=loadECG('16786m');
person8=lead18(1:sampleskept);
person8=filterECG(person8,2,1,40,128);
beats8=SplitECG(person8,nobeats);

[tm9,signal9,lead19,Fs9,labels9,t9]=loadECG('16795m');
person9=lead19(1:sampleskept);
person9=filterECG(person9,2,1,40,128);
beats9=SplitECG(person9,nobeats);

[tm10,signal10,lead110,Fs10,labels10,t10]=loadECG('17052m');
person10=lead110(1:sampleskept);
person10=filterECG(person10,2,1,40,128);
beats10=SplitECG(person10,nobeats);

[tm11,signal11,lead111,Fs11,labels11,t11]=loadECG('17453m');
person11=lead111(1:sampleskept);
person11=filterECG(person11,2,1,40,128);
beats11=SplitECG(person11,nobeats);

[tm12,signal12,lead112,Fs12,labels12,t12]=loadECG('18177m');
person12=lead112(1:sampleskept);
person12=filterECG(person12,2,1,40,128);
beats12=SplitECG(person12,nobeats);

[tm13,signal13,lead113,Fs13,labels13,t13]=loadECG('18184m');
person13=lead113(1:sampleskept);
person13=filterECG(person13,2,1,40,128);
beats13=SplitECG(person13,nobeats);

[tm14,signal14,lead114,Fs14,labels14,t14]=loadECG('19088m');
person14=lead114(10000:10000+sampleskept);
person14=filterECG(person14,2,1,40,128);
beats14=SplitECG(person14,nobeats);

[tm15,signal15,lead115]=loadECG('19090m');
person15=lead115(10000:10000+sampleskept);
person15=filterECG(person15,2,1,40,128);
beats15=SplitECG(person15,nobeats);

[tm16,signal16,lead116]=loadECG('19093m');
person16=lead116(10000:10000+sampleskept);
person16=filterECG(person16,2,1,40,128);
beats16=SplitECG(person16,nobeats);

[tm17,signal17,lead117]=loadECG('19140m');
person17=lead117(10000:10000+sampleskept);
person17=filterECG(person17,2,1,40,128);
beats17=SplitECG(person17,nobeats);

[tm18,signal18,lead118]=loadECG('19830m');
person18=lead118(2000000:2000000+sampleskept);
person18=filterECG(person18,2,1,40,128);
beats18=SplitECG(person18,nobeats);