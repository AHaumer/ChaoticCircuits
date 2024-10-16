within ChaoticCircuits.ChaoticOscillator;
model ImprovedCircuit "A simple chaotic oscillator for educational purposes"
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
  Real x=vc/nVt "Result capacitor.v / nVt";
  Real y=Z*iL/nVt "Result inductor.i *Z/nVt";
  Real z=vs/nVt "Result c*.v / nVt";
  //initialization
  parameter SI.Voltage vc0=0 "Initial voltage of capacitor";
  parameter SI.Voltage vs0=0 "Initial voltage of c*";
  parameter SI.Current iL0=0 "Initial current of inductor";
  SI.Current i_r1(start=0)=r1.i "Current of resistor r1";
  Modelica.Electrical.Analog.Basic.Ground ground
    annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
  Modelica.Electrical.Analog.Basic.Resistor r(R=R)
                                              annotation (Placement(
        transformation(
        extent={{10,-10},{-10,10}},
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
  Modelica.Electrical.Analog.Ideal.IdealizedOpAmpLimited opAmp(Vps=+Vb, Vns=-Vb)
    annotation (Placement(transformation(extent={{-10,30},{10,10}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor(v(fixed=true, start=vc0),
      C=C) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={-40,40})));
  Modelica.Electrical.Analog.Basic.Inductor inductor(i(fixed=true, start=iL0), L=L)
    annotation (Placement(transformation(extent={{-40,50},{-20,70}})));
  Modelica.Electrical.Analog.Basic.Resistor rL(R=RL)
    annotation (Placement(transformation(extent={{-10,50},{10,70}})));
  Modelica.Electrical.Analog.Basic.Capacitor cs(v(fixed=true, start=vs0), C=Cs)
                                                annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={10,40})));
  Modelica.Electrical.Analog.Semiconductors.Diode  diode(Ids=Ids, Vt=nVt)
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
  connect(constantVoltage.p, r0.p)
    annotation (Line(points={{70,60},{60,60}}, color={0,0,255}));
  connect(opAmp.out, r2.p)
    annotation (Line(points={{10,20},{10,10}}, color={0,0,255}));
  connect(r2.n, r1.p)
    annotation (Line(points={{10,-10},{10,-20}}, color={0,0,255}));
  connect(r2.n, opAmp.in_n)
    annotation (Line(points={{10,-10},{-10,-10},{-10,14}}, color={0,0,255}));
  connect(diode.p, r0.n)
    annotation (Line(points={{30,50},{30,60},{40,60}}, color={0,0,255}));
  connect(opAmp.out, cs.n)
    annotation (Line(points={{10,20},{10,30}}, color={0,0,255}));
  connect(ground.p, r.p)
    annotation (Line(points={{-10,-40},{-40,-40}}, color={0,0,255}));
  connect(opAmp.in_p, capacitor.p)
    annotation (Line(points={{-10,26},{-40,26},{-40,30}}, color={0,0,255}));
  connect(opAmp.in_p, r.n)
    annotation (Line(points={{-10,26},{-40,26},{-40,-20}}, color={0,0,255}));
  connect(capacitor.n, inductor.p)
    annotation (Line(points={{-40,50},{-40,60}}, color={0,0,255}));
  connect(cs.p, r0.n)
    annotation (Line(points={{10,50},{10,60},{40,60}}, color={0,0,255}));
  connect(rL.n, cs.p)
    annotation (Line(points={{10,60},{10,50}}, color={0,0,255}));
  connect(inductor.n, rL.p)
    annotation (Line(points={{-20,60},{-10,60}}, color={0,0,255}));
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
end ImprovedCircuit;
