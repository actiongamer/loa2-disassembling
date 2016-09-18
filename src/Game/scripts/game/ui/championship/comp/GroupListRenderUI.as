package game.ui.championship.comp
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GroupListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="119" height="42" buttonMode="true">
			  <Image skin="png.uiChampionship.底框"/>
			  <Image skin="png.uiChampionship.巅峰对决框" var="img_light"/>
			  <Image skin="png.uiChampionship.选中框" x="-1" y="-32" var="img_selected"/>
			  <Label text="总冠军" autoSize="none" x="2" y="11" style="渐变2" width="113" height="25" align="center" size="12" var="l_txt"/>
			</View>;
       
      
      public var img_light:Image = null;
      
      public var img_selected:Image = null;
      
      public var l_txt:Label = null;
      
      public function GroupListRenderUI()
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
