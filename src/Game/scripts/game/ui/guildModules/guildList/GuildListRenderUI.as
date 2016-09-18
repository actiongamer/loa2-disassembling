package game.ui.guildModules.guildList
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.GRect;
   import morn.core.components.Label;
   import morn.core.components.Button;
   
   public class GuildListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="770" height="52">
			  <Image skin="png.uiGuildModule.公会排行-选中" width="750" height="46" sizeGrid="8,8,8,8," var="img_select" x="14" y="3"/>
			  <GRect fillAlpha="0" radius="0,0,0,0" lineAlpha="0" x="14" y="3" width="749" height="46" var="toolTipArea"/>
			  <Label text="4" autoSize="none" x="33" y="19" var="txt_rank" align="center" width="35" style="普通说明"/>
			  <Label text="远古生物哥布" autoSize="none" x="254" y="16" var="txt_name" align="center" width="120" style="普通说明" size="14" height="30" underline="true" buttonMode="true"/>
			  <Label text="哥布林哥布林" autoSize="center" x="383" y="16" var="txt_ownerName" align="center" width="111" style="普通说明" size="14" underline="true" height="30" buttonMode="true"/>
			  <Label text="10" autoSize="none" x="164" y="19" var="txt_level" align="center" width="82" style="普通说明"/>
			  <Label text="60/20" autoSize="none" x="490" y="19" var="txt_memberCnt" align="center" width="111" height="27" style="普通说明"/>
			  <Button label="加为好友" stateNum="1" buttonMode="true" labelColors="0xebe5d6,0xe1dfd6,0xada99b" labelSize="13" labelFont="FZZHB" x="660" y="13" sizeGrid="3,3,3,3" var="btn_option" style="按钮中棕"/>
			  <Label text="\l11000836" autoSize="none" x="648" y="17" var="txt_status" align="center" width="111" height="25" style="普通说明" size="14"/>
			  <Label text="0" autoSize="none" x="554" y="19" var="txt_friendCnt" align="center" width="111" style="普通说明" height="23"/>
			  <Box x="129" y="30">
			    <Image skin="png.comp.image" width="36" height="36" var="img_bg" anchorX=".5" anchorY=".5"/>
			    <Image skin="png.comp.image" width="36" height="36" var="img_icon" anchorX=".5" anchorY=".5"/>
			  </Box>
			  <Image skin="png.a5.commonImgs.rank.img_crown1" anchorX=".5" anchorY=".5" x="51" var="img_crwon" y="27"/>
			</View>;
       
      
      public var img_select:Image = null;
      
      public var toolTipArea:GRect = null;
      
      public var txt_rank:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_ownerName:Label = null;
      
      public var txt_level:Label = null;
      
      public var txt_memberCnt:Label = null;
      
      public var btn_option:Button = null;
      
      public var txt_status:Label = null;
      
      public var txt_friendCnt:Label = null;
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_crwon:Image = null;
      
      public function GuildListRenderUI()
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
