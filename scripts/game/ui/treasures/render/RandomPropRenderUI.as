package game.ui.treasures.render
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class RandomPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="159" height="26">
			  <Label autoSize="none" x="3" y="5" width="86" height="18" text="格挡的等级：" var="txt_name" style="人名1不随品质变化" align="right"/>
			  <Label text="100/100" autoSize="left" x="86" y="5" height="18" var="txt_value" width="73" style="人名1不随品质变化"/>
			  <Image skin="png.uiTreasure.刻印-数据分割线" x="24" y="25"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public function RandomPropRenderUI()
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
