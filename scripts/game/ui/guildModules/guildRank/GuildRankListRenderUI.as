package game.ui.guildModules.guildRank
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class GuildRankListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="763" height="30" buttonMode="false">
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" width="763" height="30"/>
			  <Image skin="png.uiGuildModule.公会排行-选中" width="763" height="30" sizeGrid="8,8,8,8," var="img_select"/>
			  <Label text="100" autoSize="none" x="191" y="7" bold="false" width="97" height="18" align="center" var="txt_lvl" style="普通说明" mouseEnabled="false"/>
			  <Label text="公会名字啦啦" autoSize="none" x="76" y="7" bold="false" align="center" width="120" height="18" var="txt_name" style="普通说明" mouseEnabled="true" underline="true" mouseChildren="true" buttonMode="true"/>
			  <Label text="公会会长名" autoSize="none" x="548" y="7" bold="false" align="center" width="108" height="18" var="txt_owner" style="普通说明" mouseEnabled="true" underline="true" buttonMode="true" mouseChildren="true"/>
			  <Label text="10020万" autoSize="none" x="285" y="7" bold="false" align="center" width="120" height="18" var="txt_power" style="普通说明" mouseEnabled="false"/>
			  <Label text="200/200" autoSize="none" x="660" y="7" bold="false" align="center" width="108" height="18" var="txt_member" style="普通说明" mouseEnabled="false"/>
			  <Label text="4" autoSize="none" x="9" y="6" bold="false" width="60" height="18" align="center" var="txt_rank" style="普通说明" size="14"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgSmall" x="450" y="2" width="24" height="24" sizeGrid="6,6,6,6"/>
			  <Image skin="png.comp.image" x="452" y="4" width="20" height="20" var="img_bg"/>
			  <Image skin="png.comp.image" x="452" y="4" width="20" height="20" var="img_icon"/>
			  <Box x="40" y="14">
			    <Image skin="png.a5.commonImgs.rank.img_crown1" x="0" y="1" anchorX=".5" anchorY=".5" var="img_crown"/>
			  </Box>
			</View>;
       
      
      public var img_select:Image = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_owner:Label = null;
      
      public var txt_power:Label = null;
      
      public var txt_member:Label = null;
      
      public var txt_rank:Label = null;
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_crown:Image = null;
      
      public function GuildRankListRenderUI()
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
