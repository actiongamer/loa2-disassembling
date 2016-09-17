package game.ui.horseModules.comps
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class HorseTitleNameUI extends View
   {
      
      protected static var uiView:XML = <View width="284" height="37">
			  <Image skin="png.a5.commonImgs.img_NameBg_2" x="0" y="0" width="284" height="37"/>
			  <Label text="长江一号" x="75" y="8" width="131" height="24" var="txt_name" style="人名1不随品质变化" bold="true" align="center" size="15" mouseEnabled="false"/>
			</View>;
       
      
      public var txt_name:Label = null;
      
      public function HorseTitleNameUI()
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
