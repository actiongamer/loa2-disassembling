package game.ui.guildModules.guildShardDonate
{
   import morn.customs.components.WealthRender;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   
   public class GuildHeroShardRenderUI extends WealthRender
   {
      
      protected static var uiView:XML = <WealthRender width="143" height="135">
			  <Image skin="png.a5.bgs.panelBgs.img_panelBgS6" sizeGrid="4,4,4,4" width="143" height="135" var="img_bg"/>
			  <Image skin="png.uiGuildModule.heroShard.img_mask"/>
			  <Box var="box1">
			    <Image skin="png.a5.comps.img_block" var="img_icon" width="143" height="135" autoSize="true"/>
			    <Image skin="png.a5.comps.img_block" autoSize="false" height="135" var="img_quality" width="143"/>
			    <Image skin="png.uiGuildModule.heroShard.img_mask" var="img_mask"/>
			    <Label text="普罗米修斯" x="0" y="95" width="143" height="24" var="txt_name" style="随品质变化" align="center"/>
			    <Image skin="png.a5.comps.img_block" x="19" y="133" anchorX="0.5" anchorY="1" autoSize="true" width="22" height="22" var="img_career"/>
			    <Label text="碎片: 99/999" autoSize="none" y="110" style="重要提示橘黄" width="143" size="12" align="center" var="txt_num" height="18" x="0"/>
			  </Box>
			</WealthRender>;
       
      
      public var img_bg:Image = null;
      
      public var box1:Box = null;
      
      public var img_icon:Image = null;
      
      public var img_quality:Image = null;
      
      public var img_mask:Image = null;
      
      public var txt_name:Label = null;
      
      public var img_career:Image = null;
      
      public var txt_num:Label = null;
      
      public function GuildHeroShardRenderUI()
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
