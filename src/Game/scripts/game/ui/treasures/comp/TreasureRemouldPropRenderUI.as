package game.ui.treasures.comp
{
   import morn.customs.components.NpcPropRender;
   import morn.core.components.Label;
   
   public class TreasureRemouldPropRenderUI extends NpcPropRender
   {
      
      protected static var uiView:XML = <NpcPropRender width="175" height="20" name="selectBox2">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="175" height="20"/>
			  <Label autoSize="none" x="25" y="2" width="92" height="18" text="攻击击击击击击" var="txt_name" style="人名1不随品质变化" align="left"/>
			  <Label autoSize="none" x="119" y="2" width="75" height="18" text="+11.5%" var="txt_value" style="人名1不随品质变化" align="left"/>
			  <Image skin="png.uiTreasure2.重铸 洗炼.锁" x="0" y="3" name="selectBox1"/>
			  <RadioButton x="-7" y="0" style="Radio普通" selected="true" name="selectBox2"/>
			  <Label autoSize="none" x="25" y="2" width="150" height="18" text="?" var="txt_null" style="人名1不随品质变化" align="center" visible="false"/>
			</NpcPropRender>;
       
      
      public var txt_name:Label = null;
      
      public var txt_value:Label = null;
      
      public var txt_null:Label = null;
      
      public function TreasureRemouldPropRenderUI()
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
