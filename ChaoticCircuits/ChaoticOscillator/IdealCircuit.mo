within ChaoticCircuits.ChaoticOscillator;
model IdealCircuit "A simple chaotic oscillator for educational purposes"
  extends Modelica.Icons.Example;
  //time constant and dimensionless parameters
  parameter SI.Current I0=Vb/R0 "Estimated supply current";
  parameter SI.Time Tau=sqrt(L*C) "Time constant";
  parameter SI.Impedance Z=sqrt(L/C) "Characteristic impedance (rho)";
  parameter Real k=Z/R*a + 1 + RL/R "Amplification";
  parameter Real a=0.95;
  parameter Real b=Z*I0/nVt;
  parameter Real c=Z*Ids/nVt;
  parameter Real e=Cs/C "epsilon";
  //components
  parameter SI.Resistance R =1.0e3 "Resistor r";
  parameter SI.Resistance R1=10.e3 "Resistor r1";
  parameter SI.Resistance R2=R1*(k - 1) "Resistor r2 (tunable)";
  parameter SI.Resistance R0=20.e3 "Resistor r0";
  parameter SI.Voltage Vb=20 "Supply voltage";
  parameter SI.Inductance L=100e-3 "Inductor";
  parameter SI.Resistance RL=50 "Resistance of Inductor";
  parameter SI.Capacitance C =100e-9 "Capacitor c";
  parameter SI.Capacitance Cs=15.e-9 "Capacitor c*";
  //diode
  parameter SI.Current Ids=1e-9 "Diode: saturation current";
  parameter SI.Voltage nVt=2*26e-3 "Diode: n * voltage equivalent of temperature";
  //shortcut to results
  SI.Current iL=inductor.i "Result inductor.i";
  SI.Voltage vc=capacitor.v "Result capacitor.v";
  SI.Voltage vs=cs.v "Result c*.v";
  Real x(start=0, fixed=true)=vc/nVt "Result capacitor.v / nVt";
  Real y(start=0, fixed=true)=Z*iL/nVt "Result inductor.i *Z/nVt";
  Real z(start=0, fixed=true)=vs/nVt "Result c*.v / nVt";
  //initialization
//SI.Voltage vd(start=0)=diode.vd "Voltage of diode";
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor r(R=R)
                                              annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-40,-30})));
  Modelica.Electrical.Analog.Basic.Resistor r1(R=R1)
                                               annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,-30})));
  Modelica.Electrical.Analog.Basic.Resistor r2(R=R2)
                                               annotation (Placement(
        transformation(extent={{-10,-10},{10,10}},rotation=270,
        origin={10,0})));
  Modelica.Electrical.Analog.Ideal.IdealOpAmp3Pin opAmp
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(C=C)
    annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-40,40})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(L=L)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rL(R=RL)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Electrical.Analog.Basic.Capacitor cs(C=Cs)
    annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,40})));
  Components.SimpleDiode                           diode(
    Ids=Ids, nVt=nVt)
             annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={30,40})));
  Modelica.Electrical.Analog.Basic.Resistor r0(R=R0)
    annotation (Placement(transformation(extent={{60,50},{40,70}})));
  Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage(V=Vb)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={70,50})));
equation
  connect(r1.n, ground.p)
    annotation (Line(points={{10,-40},{-10,-40}},  color={0,0,255}));
  connect(opAmp.out, diode.n)
    annotation (Line(points={{10,20},{30,20},{30,30}}, color={0,0,255}));
  connect(ground.p, constantVoltage.n)
    annotation (Line(points={{-10,-40},{70,-40},{70,40}}, color={0,0,255}));
  connect(r0.p, constantVoltage.p)
    annotation (Line(points={{60,60},{70,60}}, color={0,0,255}));
  connect(r2.n, r1.p)
    annotation (Line(points={{10,-10},{10,-20}}, color={0,0,255}));
  connect(opAmp.out, r2.p)
    annotation (Line(points={{10,20},{10,10}}, color={0,0,255}));
  connect(r2.n, opAmp.in_n)
    annotation (Line(points={{10,-10},{-10,-10},{-10,14}}, color={0,0,255}));
  connect(diode.p, r0.n)
    annotation (Line(points={{30,50},{30,60},{40,60}}, color={0,0,255}));
  connect(cs.n, opAmp.out)
    annotation (Line(points={{10,30},{10,20}}, color={0,0,255}));
  connect(r0.n, cs.p)
    annotation (Line(points={{40,60},{10,60},{10,50}}, color={0,0,255}));
  connect(r0.n, rL.n)
    annotation (Line(points={{40,60},{10,60}}, color={0,0,255}));
  connect(inductor.n, rL.p)
    annotation (Line(points={{-20,60},{-10,60}}, color={0,0,255}));
  connect(inductor.p, capacitor.n)
    annotation (Line(points={{-40,60},{-40,50}}, color={0,0,255}));
  connect(capacitor.p, opAmp.in_p)
    annotation (Line(points={{-40,30},{-40,26},{-10,26}}, color={0,0,255}));
  connect(opAmp.in_p, r.p)
    annotation (Line(points={{-10,26},{-40,26},{-40,-20}}, color={0,0,255}));
  connect(ground.p, r.n)
    annotation (Line(points={{-10,-40},{-40,-40}}, color={0,0,255}));
  annotation (Documentation(info="<html>
<p>See documentation of the enclosing subpackage.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={
        Rectangle(
          extent={{-22,30},{22,-56}},
          lineColor={170,213,255},
          fillPattern=FillPattern.Solid,
          fillColor={170,213,255}),
                      Line(
          points={{0,-6},{20,6}},
          color={0,0,0},
          arrow={Arrow.None,Arrow.Open})}));
end IdealCircuit;
