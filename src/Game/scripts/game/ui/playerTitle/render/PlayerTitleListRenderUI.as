package game.ui.playerTitle.render
{
   import morn.core.components.View;
   import morn.core.components.Label;
   
   public class PlayerTitleListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="178" height="25">
			  <Image skin="png.uiPlayerTitle.称号按钮-暗" x="0" y="0"/>
			  <Image skin="png.uiPlayerTitle.称号按钮-亮" x="0" y="0" name="selectBox1" visible="false"/>
			  <Label text="pageBarS2" autoSize="none" x="26" y="2" style="普通说明" width="150" height="20" align="center" var="label_listTitle"/>
			</View>;
       
      
      public var label_listTitle:Label = null;
      
      public function PlayerTitleListRenderUI()
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
