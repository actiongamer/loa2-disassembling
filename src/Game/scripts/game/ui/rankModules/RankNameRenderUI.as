package game.ui.rankModules
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RankNameRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="200" height="60" buttonMode="true">
			  <Image skin="png.a5.comps.img_block" x="97" y="29" anchorX="0.5" anchorY="0.5" width="195" height="60" var="img_waiwei" autoSize="true" buttonMode="true"/>
			  <Image skin="png.a5.comps.img_block" anchorX="0.5" anchorY="0.5" width="195" height="60" var="img_bg" autoSize="true" x="97" y="30" name="selectBox1" buttonMode="true"/>
			  <Image skin="png.uiRankModule.选中框02" name="selectBoxAll" x="-4" y="-3" buttonMode="true"/>
			  <Image skin="png.a5.comps.img_block" x="30" y="30" anchorX="0.5" anchorY="0.5" width="42" height="42" var="img_tubiao" autoSize="true" buttonMode="true"/>
			  <Label text="渐变1" autoSize="none" x="50" y="20" style="渐变1" width="141" height="31" align="center" var="txt_bangdanname" buttonMode="true" mouseChildren="false" multiline="true" wordWrap="true"/>
			</View>;
       
      
      public var img_waiwei:Image = null;
      
      public var img_bg:Image = null;
      
      public var img_tubiao:Image = null;
      
      public var txt_bangdanname:Label = null;
      
      public function RankNameRenderUI()
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
