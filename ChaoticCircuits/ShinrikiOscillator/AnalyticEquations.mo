within ChaoticCircuits.ShinrikiOscillator;
model AnalyticEquations "Shinriki oscillator"
  extends Modelica.Icons.Example;
  parameter SI.Inductance L=320e-3 "Inductor";
  parameter SI.Resistance RL=100. "Resistor of L";
  parameter SI.Resistance R1=60e3 "Resistor 1";
  parameter SI.Resistance R2=20e3 "Resistor 2";
  parameter SI.Capacitance C1=10.e-9 "Capacitor 1";
  parameter SI.Capacitance C2=100e-9 "Capacitor 2";
  parameter SI.Voltage Vs=15 "Supply Voltage";
  //z-Diode-pair
  parameter SI.Voltage Vbt=3.3 "Break-through voltage";
  parameter Real a=1.0862e-3 "Coefficient a [A/V]";
  parameter Real b=-0.1615e-3 "Coefficient b [A/V^3]";
  parameter Real c=0.3021e-3 "Coefficient c [A/V^5]";
  //Negative Impedance Converter
  parameter ParameterSets.NIC.NIC_Shinriki nicData
    annotation (Placement(transformation(extent={{60,60},{80,80}})));
  //shortcut to results
  SI.Voltage v1(start=0, fixed=true) "Result 1 c1.v";
  SI.Voltage v2(start=1, fixed=true) "Result 2 c2.v";
  SI.Voltage vRL(start=0, fixed=true)=RL*iL "Voltage of inductor's resistance";
  //auxilliary variables
  SI.Voltage vz "Voltage of z-Diode pair";
  SI.Current iz "Current through z-Diode pair";
  SI.Current iNIC "Current into NIC";
  SI.Current iL "Current through inductor";
equation
  C1*der(v1)=-iNIC - v1/R1 - iz - vz/R2;
  C2*der(v2)=iz + vz/R2 - iL;
  v2=L*der(iL) + RL*iL;
  vz=v1 - v2;
  iz=if abs(vz)<Vbt then 0 else sign(vz)*(a*(abs(vz) - Vbt) + b*(abs(vz) - Vbt)^3 + c*(abs(vz) - Vbt)^5);
  iNIC = if v1<-nicData.VLim then -nicData.VLim*nicData.gNeg + nicData.gPos*(v1 + nicData.VLim)
     elseif v1>+nicData.VLim then +nicData.VLim*nicData.gNeg + nicData.gPos*(v1 - nicData.VLim)
     else nicData.gNeg*v1;
  annotation (Documentation(info="<html>
<p>See documentation of the <a href=\"modelica://ChaoticCircuits.ShinrikiOscillator\">enclosing subpackage</a>.</p>
</html>"), experiment(
      StopTime=0.1,
      Interval=1e-06,
      Tolerance=1e-06),
    Diagram(graphics={Text(
          extent={{-80,20},{80,-20}},
          textColor={0,0,255},
          textString="R2 =   20 kOhm periodic
R2 = 8400 Ohm chaotic")}));
end AnalyticEquations;
