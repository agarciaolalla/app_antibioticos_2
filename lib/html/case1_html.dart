/*
En esta clase guardamos los HTML del caso 1 que van a mostrar informacion preestablecida a lo largo del juego
(Informacion inicial + feedbacks) en variables para su posterior uso.
*/
class Case1Html {
  final String initialInfo = ''' 
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Informaci&oacute;n inicial</strong></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Var&oacute;n de 67 a&ntilde;os sin RAMC. Como antecedentes destacan:</p>
  <ul>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>FRCV</strong>: HTA. DL. Exfumador.</p>
      </li>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">EPOC leve sin ingresos</p>
      </li>
      <li>
          <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">No cardio, hepato o gastropat&iacute;as conocidas.</p>
      </li>
  </ul>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Historia epidemiol&oacute;gica</strong>: Jubilado. Natural de &Eacute;pila, donde reside con su mujer. No contacto habitual con animales.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Tratamiento habitual</strong>: Valsart&aacute;n. Simvatatina</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Enfermedad actual</strong>: Hace 3 d&iacute;as comienza de forma r&aacute;pidamente progresiva con sensaci&oacute;n febril, que se acompa&ntilde;a de tos y expectoraci&oacute;n purulenta, as&iacute; como dolor en hemit&oacute;rax derecho. Disnea de moderados esfuerzos.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Exploraci&oacute;n f&iacute;sica</strong>: TA 100/80; FC 120 lpm; T&ordf; 38,2; FR: 24 Sat O2 91%; Talla 170 cms. Peso 80 Kg. Sudoraci&oacute;n profusa. Quebrantamiento del estado general. AC: RCRs a 120 lpm sin soplos. AP: Crepitantes inspiratorios en base derecha. Abdomen: blando y depresible, no doloroso. RHA normales. No edemas ni signos de TVP.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>An&aacute;lisis en Urgencias</strong>: Hb 13,2; Leucocitos 24.000/mm<sup>3</sup> (N 90%; L 5%); Plaquetas 110.000. Na 142; K 3,8; urea 0,65; creatinina 1,5 mg/dL; AST 23; ALT 34; GGT 60; LDH 260; PCR 280 mg/dL. GAB: pH 7,45 pO2 65; pCO2 30; HCO3 22; lactato 2</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><strong>Rx de t&oacute;rax</strong>: En sedestaci&oacute;n. Aumento de densidad de caracter&iacute;sticas alveolares en hemit&oacute;rax derecho con discreto borramiento de silueta card&iacute;aca.</p> 
  ''';

  final String firstFeedback = ''' 
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">Para el diagn&oacute;stico de neumon&iacute;a que precisa ingreso est&aacute; indicada la solicitud de cultivo de esputo, hemocultivos y ant&iacute;genos urinarios de neumococo y/o Legionella</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">En temporada de gripe y durante la pandemia de SARS-CoV-2 se realiza despistaje de ambos pat&oacute;genos ante cuadros de infecci&oacute;n respiratoria porque pueden coexistir infecci&oacute;n v&iacute;rica y bacteriana.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">En pacientes adultos en los que no se haya realizado test de VIH debemos aprovechar el contacto con el medio sanitario para realizarlo. Especialmente, en casos de neumon&iacute;a comunitaria grave.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">No hay indicaci&oacute;n para solicitar serolog&iacute;a de pat&oacute;genos at&iacute;picos de neumon&iacute;a dado que el cuadro impresiona de neumon&iacute;a bacteriana por bacteria pi&oacute;gena. S&oacute;lo deber&iacute;a solicitarse ante la sospecha de infecci&oacute;n por pat&oacute;geno at&iacute;pico y el ant&iacute;geno de Legionella.</p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;"><br></p>
  <p style="margin-bottom: 0cm;line-height: 100%;text-align: left;background: transparent;">No hay indicaci&oacute;n para solicitar urocultivo al no haber sospecha de infecci&oacute;n del tracto urinario.</p>
  ''';

  final String secondFeedback = '''
  <table cellpadding="7" cellspacing="0" width="566">
    <tbody>
        <tr>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="13.51931330472103%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Antibi&oacute;tico</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="6.437768240343348%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Dosis</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="3.8626609442060085%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10.729613733905579%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Intervalo</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="7.725321888412017%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Activo</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="39.05579399141631%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Comentario</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="18.669527896995707%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Consecuencia</strong></p>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">Ampicilina</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">2g</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">IV</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">c/6h</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">S&iacute;</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="39.05579399141631%">
                <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><strong>Tratamiento &oacute;ptimo</strong></p>
                <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;">Neumon&iacute;a neumoc&oacute;cica. El perfil se sensibilidad de <em>S. pneumoniae</em> permite usar ampicilina, que es un b-lact&aacute;mico de espectro m&aacute;s reducido que las alternativas</p>
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ninguna</p>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">Amoxicilina</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">1g</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">VO</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">c/8h</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;">S&iacute;</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="39.05579399141631%">
                <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a inadecuada</strong>.</p>
                <p style="margin-bottom: 0cm;line-height: 115%;text-align: left;background: transparent;"><br></p>
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">En pacientes con neumon&iacute;a grave es m&aacute;s adecuada la v&iacute;a intravenosa hasta comprobar estabilidad cl&iacute;nica</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Pierde un 10% de vida</p>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="13.51931330472103%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ceftriaxona</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="6.437768240343348%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">2g</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="3.8626609442060085%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">IV</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10.729613733905579%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/24h</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.725321888412017%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: center;background: transparent;"><strong>S&iacute;</strong></p>
            </td>
            <td style="border: 1px solid rgb(0, 0, 0);padding: 0cm 0.19cm;vertical-align: top;" valign="top" width="39.05579399141631%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Tratamiento activo pero de excesivo espectro</strong>: Neumon&iacute;a neumoc&oacute;cica confirmada. El perfil de resistencia en la comunidad permite usar alternativas igualmente eficaces pero de menor espectro.</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="18.669527896995707%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Ninguna
                    <!-- No pierde vida, pero malgasta este antibiótico que va a necesitar para tratar otra infección. -->
                </p>
            </td>
        </tr>
    </tbody>
  </table> 
  ''';

  String thirdFeedback = '''
  <table cellpadding="7" cellspacing="0" width="530">
    <tbody>
        <tr>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="22.790697674418606%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Antibi&oacute;tico</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="12.093023255813954%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Dosis</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="7.674418604651163%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>V&iacute;a</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="16.511627906976745%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Intervalo</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Activo</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>D&iacute;as</strong></p>
            </td>
            <td bgcolor="#d9d9d9" style="background: #d9d9d9;" width="20.930232558139537%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Consecuencia</strong></p>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="22.790697674418606%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Ampicilina</strong></p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="12.093023255813954%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">2g</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.674418604651163%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">IV</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="16.511627906976745%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/6h</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">S&iacute;</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">N*</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="20.930232558139537%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Si N&le;2 Pierde 20% de vida</p>
            </td>
        </tr>
        <tr>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="22.790697674418606%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;"><strong>Amoxicilina</strong></p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="12.093023255813954%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">1g</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="7.674418604651163%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">VO</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="16.511627906976745%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">c/8h</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">S&iacute;</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="10%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">N*</p>
            </td>
            <td style="border: 1px solid #000000;padding: 0cm 0.19cm;" width="20.930232558139537%">
                <p style="margin-bottom: 0.25cm;line-height: 115%;text-align: left;background: transparent;">Si N&le;2 Pierde 20% de vida</p>
            </td>
        </tr>
    </tbody>
  </table> 
  ''';
}
