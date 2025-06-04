within ChaoticCircuits.Components;
model MemristorReplacement
  "Flux-controlled Memristor with partly negative conductance"
  extends Modelica.Electrical.Analog.Interfaces.TwoPin;
  SI.Current i = p.i "Current through memristor";
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin
                    opAmp1_1
    annotation (Placement(transformation(extent={{-80,0},{-60,-20}})));
  Modelica.Electrical.Analog.Basic.Resistor r6(R=8200)
    annotation (Placement(transformation(extent={{-50,-20},{-30,0}})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin
                    opAmp1
    annotation (Placement(transformation(extent={{-20,-30},{0,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(fixed=true), C=4.7e-9)
    annotation (Placement(transformation(extent={{0,-10},{-20,10}})));
  Multiplier multiplier1
    annotation (Placement(transformation(extent={{20,-30},{40,-10}})));
  Multiplier multiplier2(useZ=true)
    annotation (Placement(transformation(extent={{20,20},{40,40}})));
  ImprovedOpAmp3Pin opAmp2 annotation (Placement(transformation(
        extent={{-10,10},{10,-10}},
        rotation=90,
        origin={60,80})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=2000) annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={40,80})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=2000) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,80})));
  Modelica.Electrical.Analog.Basic.Resistor r3(R=1500) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,50})));
  Modelica.Electrical.Analog.Basic.Resistor r4(R=3000) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,10})));
  Modelica.Electrical.Analog.Basic.Resistor r5(R=36000) annotation (Placement(
        transformation(
        extent={{-10,10},{10,-10}},
        rotation=270,
        origin={80,-30})));
protected
  //additional initialization
  SI.Voltage v_in2(start=0)=opAmp2.v_in.v;
  SI.Voltage vr6n(start=0)=r6.n.v;
  SI.Current ir2(start=0)=r2.i;
equation
  connect(opAmp1_1.in_n, opAmp1_1.out) annotation (Line(points={{-80,-16},{-90,-16},
          {-90,-30},{-60,-30},{-60,-10}},
                                        color={0,0,255}));
  connect(opAmp1_1.out, r6.p)
    annotation (Line(points={{-60,-10},{-50,-10}},
                                               color={0,0,255}));
  connect(r6.n, opAmp1.in_n)
    annotation (Line(points={{-30,-10},{-30,-14},{-20,-14}},
                                                         color={0,0,255}));
  connect(opAmp1.out, capacitor.p)
    annotation (Line(points={{0,-20},{0,0}},  color={0,0,255}));
  connect(opAmp1.in_n, capacitor.n)
    annotation (Line(points={{-20,-14},{-20,0}}, color={0,0,255}));
  connect(opAmp1.out, multiplier1.in1) annotation (Line(points={{0,-20},{10,-20},
          {10,-14},{20,-14}}, color={0,0,255}));
  connect(opAmp1.out, multiplier1.in2) annotation (Line(points={{0,-20},{10,-20},
          {10,-26},{20,-26}}, color={0,0,255}));
  connect(multiplier1.out, multiplier2.in2) annotation (Line(points={{40,-20},{48,
          -20},{48,0},{10,0},{10,24},{20,24}}, color={0,0,255}));
  connect(opAmp2.out, r1.p)
    annotation (Line(points={{60,90},{40,90}}, color={0,0,255}));
  connect(opAmp2.out, r2.p)
    annotation (Line(points={{60,90},{80,90}}, color={0,0,255}));
  connect(r1.n, opAmp2.in_p) annotation (Line(points={{40,70},{54,70}},
                color={0,0,255}));
  connect(opAmp2.in_n, r2.n) annotation (Line(points={{66,70},{80,70}},
                color={0,0,255}));
  connect(opAmp2.in_n, r3.p)
    annotation (Line(points={{66,70},{80,70},{80,60}}, color={0,0,255}));
  connect(r4.n, r5.p)
    annotation (Line(points={{80,0},{80,-20}}, color={0,0,255}));
  connect(r3.n, r4.p)
    annotation (Line(points={{80,40},{80,20}}, color={0,0,255}));
  connect(multiplier2.out, r4.p)
    annotation (Line(points={{40,30},{80,30},{80,20}}, color={0,0,255}));
  connect(r4.n, multiplier2.z) annotation (Line(points={{80,0},{80,-10},{60,-10},
          {60,10},{30,10},{30,20}}, color={0,0,255}));
  connect(p, opAmp1_1.in_p) annotation (Line(points={{-100,0},{-90,0},{-90,-4},{
          -80,-4}}, color={0,0,255}));
  connect(p, multiplier2.in1) annotation (Line(points={{-100,0},{-90,0},{-90,40},
          {10,40},{10,36},{20,36}}, color={0,0,255}));
  connect(multiplier2.in1, opAmp2.in_p) annotation (Line(points={{20,36},{10,36},
          {10,60},{40,60},{40,70},{54,70}}, color={0,0,255}));
  connect(r5.n, n) annotation (Line(points={{80,-40},{80,-50},{100,-50},{100,0}},
        color={0,0,255}));
  connect(opAmp1.in_p, n) annotation (Line(points={{-20,-26},{-20,-50},{100,-50},
          {100,0}}, color={0,0,255}));
  annotation (defaultComponentName="memristor",
    Icon(graphics={
        Rectangle(
          extent={{-70,30},{70,-30}},
          lineColor={0,0,255},
          fillColor={255,213,170},
          fillPattern=FillPattern.CrossDiag),
        Line(points={{-34,-31},{-43,-14},{-51,6},{-60,30}}, color={0,0,0},
          smooth=Smooth.Bezier),
        Line(points={{34,-31},{43,-14},{51,6},{60,30}},     color={0,0,0},
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{-70,30},{-64,-30}},
          lineColor={0,0,255},
          fillColor={0,0,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-90,0},{-58,0},{-58,-20},{-38,-20},{-38,20},{-18,20},{-18,
              -20},{2,-20},{2,20},{22,20},{22,-20},{42,-20},{42,20},{62,20},{62,
              0},{90,0}}, color={0,0,255}),
        Text(
          extent={{-100,100},{100,70}},
          textColor={0,0,255},
          textString="%name"),
        Line(
          points={{0,-60},{-9,-58},{-17,-53},{-26,-43},{-34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(
          points={{0,-60},{9,-58},{17,-53},{26,-43},{34,-31}},
          color={238,46,47},
          smooth=Smooth.Bezier),
        Line(points={{80,0},{80,-40}}, color={0,0,255}),
        Line(
          points={{0,10},{0,-10}},
          color={0,0,255},
          origin={80,-40},
          rotation=90),
        Line(
          points={{0,6},{0,-6}},
          color={0,0,255},
          origin={80,-46},
          rotation=90),
        Line(
          points={{0,2},{0,-2}},
          color={0,0,255},
          origin={80,-52},
          rotation=90)}),                                Documentation(info="<html>
<p>
This circuit replaces the memristor as shown in <a href=\"modelica://ChaoticCircuits.UsersGuide.References\"> [Muthuswamy2010a] </a> Fig. 6.
</p>
</html>"));
end MemristorReplacement;
