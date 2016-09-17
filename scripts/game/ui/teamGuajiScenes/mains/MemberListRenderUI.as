package game.ui.teamGuajiScenes.mains
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Box;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   
   public class MemberListRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="270" height="70">
			  <Image skin="png.uiTeamGuajis.img_emptMember" var="img_emptyBg"/>
			  <Box var="box_memberBg" x="0" y="-8">
			    <Image skin="png.uiTeamGuajis.img_memberBg" var="img_memberBg" visible="true" y="8"/>
			    <Image skin="png.uiTeamGuajis.2" scale=".5" smoothing="true" x="4" var="img_headIcon"/>
			    <Image skin="png.uiTeamGuajis.等级底" x="39" y="35"/>
			  </Box>
			  <Box x="15" y="10" var="box_emptyContent">
			    <Label text="\l41210121 " autoSize="left" style="普通说明" y="19" x="43"/>
			    <Label text="\l41210120 " autoSize="left" x="67" style="普通说明"/>
			    <Image skin="png.uiTeamGuajis.箭头" y="4" x="43"/>
			    <Image skin="png.a5.commonImgs.加号" y="6" var="img_plus" mouseChildren="true" buttonMode="true"/>
			  </Box>
			  <Box x="27" y="6" var="box_member">
			    <Label text="人名1不随品质变化" autoSize="left" x="34" style="人名1不随品质变化" var="txt_name"/>
			    <Label text="战力" autoSize="none" y="21" style="渐变4" width="104" height="20" align="center" size="16" x="0"/>
			    <ClipList value="9900000" clipWidth="14" align="left" url="png.a5.comps.clipList.clipList_S15" x="72" y="22" gapX="-1" var="txt_fightPower"/>
			    <Label text="13" autoSize="none" x="7" y="25" style="渐变1" width="30" height="22" align="center" size="12" var="txt_lvl"/>
			    <Label text="人名1不随品质变化" autoSize="left" x="34" style="普通说明" y="46" var="txt_status"/>
			  </Box>
			</View>;
       
      
      public var img_emptyBg:Image = null;
      
      public var box_memberBg:Box = null;
      
      public var img_memberBg:Image = null;
      
      public var img_headIcon:Image = null;
      
      public var box_emptyContent:Box = null;
      
      public var img_plus:Image = null;
      
      public var box_member:Box = null;
      
      public var txt_name:Label = null;
      
      public var txt_fightPower:ClipList = null;
      
      public var txt_lvl:Label = null;
      
      public var txt_status:Label = null;
      
      public function MemberListRenderUI()
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
