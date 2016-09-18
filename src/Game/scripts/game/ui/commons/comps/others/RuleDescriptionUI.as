package game.ui.commons.comps.others
{
   import morn.core.components.View;
   import morn.core.components.Image;
   
   public class RuleDescriptionUI extends View
   {
      
      protected static var uiView:XML = <View width="144" height="34" buttonMode="true">
			  <Image skin="png.a5.commonImgs.img_rule_bg" x="19" y="2"/>
			  <Image skin="png.a5.commonImgs.img_rule" x="1" y="1" var="btn_rule"/>
			  <Label text="\l41500003" autoSize="none" x="36" y="8" style="普通说明" mouseEnabled="false" mouseChildren="false"/>
			</View>;
       
      
      public var btn_rule:Image = null;
      
      public function RuleDescriptionUI()
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
