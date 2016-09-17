package game.ui.PwdModule
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.TextInput;
   import morn.core.components.Button;
   
   public class PwdModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="600" height="400">
			  <PanelBg x="126" y="32" width="374" height="302"/>
			  <Image skin="png.a5.bgs.panelBgs.img_bgS2" x="244" y="160" width="133" height="33"/>
			  <TextInput x="247" y="165" color="0xd1cdbf" var="txt_pwdInput" multiline="false" wordWrap="false" maxChars="8" backgroundColor="0xcc66" background="false"/>
			  <Button label="\l10000012\l" stateNum="1" buttonMode="true" labelColors="0xd1cdbf,0xe1dfd6,0xada99b" labelSize="15" labelFont="SSZH" letterSpacing="2" skin="png.a5.btns.btn_middle_S1" x="256" y="229" var="btn_confirm"/>
			</PopModuleView>;
       
      
      public var txt_pwdInput:TextInput = null;
      
      public var btn_confirm:Button = null;
      
      public function PwdModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         createView(uiView);
      }
   }
}
