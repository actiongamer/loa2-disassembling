package game.ui.mainToolBar
{
   import morn.customs.components.TopModuleView;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class NewerFunctionOpenMsgModuleUI extends TopModuleView
   {
      
      protected static var uiView:XML = <TopModuleView width="300" height="187">
			  <Image skin="png.uiMainToolBar.开启底" x="-55" y="0"/>
			  <Image skin="png.comp.image" x="30" y="52" var="img_new" width="60" height="60"/>
			  <Image skin="png.uiMainToolBar.开启底头像框" x="24" y="41"/>
			  <Label text="渐变渐变" autoSize="none" x="10" y="95" style="渐变3" align="center" var="txtFunName" mouseChildren="false" mouseEnabled="false" width="102" size="15" height="33"/>
			  <Label text="渐变渐变" autoSize="none" x="108.5" y="58" style="渐变3" align="left" var="txtOpenLv" mouseChildren="false" mouseEnabled="false" width="195" size="15" height="32"/>
			  <Label text="渐变渐变" autoSize="none" x="111" y="84" align="left" var="txtFunDesc" mouseChildren="false" mouseEnabled="false" width="195" size="15" height="52" multiline="true" wordWrap="true"/>
			  <Button skin="png.a5.btns.btn_closeS1" y="28" stateNum="1" right="6" var="btn_close" x="283"/>
			</TopModuleView>;
       
      
      public var img_new:Image = null;
      
      public var txtFunName:Label = null;
      
      public var txtOpenLv:Label = null;
      
      public var txtFunDesc:Label = null;
      
      public var btn_close:Button = null;
      
      public function NewerFunctionOpenMsgModuleUI()
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
