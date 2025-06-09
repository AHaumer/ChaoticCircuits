within ChaoticCircuits.ParameterSets.DynamicDiode;
record DynamicDiodeData "Parameters for Dynamic Diode model"
  extends Modelica.Icons.Record;
  parameter String Type="1N400x";
  parameter SI.Current Ids=70e-12 "Saturation current";
  parameter SI.Voltage nVt=1.4*25e-3 "n * voltage equivalent of temperature";
  parameter SI.Capacitance C0=33e-12 "Junction capacitance at v=0";
  parameter SI.Voltage V0=0.35 "Voltage parameter for junction capacitance";
  parameter Real m=0.45 "Exponent parameter of junction capacitance";
  parameter Real fc(final min=0, final max=0.99)=0.5
    "Parameter of linear extrapolation of junction capacitance";
  parameter SI.Time TauT=5000e-9 "Transition time";
   annotation(defaultComponentPrefixes="parameter", Icon(graphics={Text(
          extent={{-100,-10},{100,-40}},
          textColor={28,108,200},
          textString="%Type")}));
end DynamicDiodeData;
