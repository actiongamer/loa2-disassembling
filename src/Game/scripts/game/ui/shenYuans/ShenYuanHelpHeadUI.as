package game.ui.shenYuans
{
   import morn.customs.components.PlayerRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   import morn.customs.components.ClipList;
   import morn.core.components.Button;
   
   public class ShenYuanHelpHeadUI extends PlayerRender
   {
      
      protected static var uiView:XML = <PlayerRender width="334" height="102">
			  <Image skin="png.uiShenYuan.help.img_head_bg" x="0" y="0"/>
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_2" x="39" y="27" var="img_quality" sizeGrid="6,6,6,6" width="58" height="58"/>
			  <Image skin="png.comp.image" x="42" y="30" width="52" height="52" var="img_icon"/>
			  <Image skin="png.uiShenYuan.help.img_head_bg2" x="85" y="12"/>
			  <Label text="当前助战好友" autoSize="left" x="99" y="14" width="150" height="18" align="center"/>
			  <Label text="名子" autoSize="left" x="112" y="43" width="98" height="22" align="left" var="txt_name"/>
			  <Label text="Lv.5" autoSize="left" x="212" y="43" width="98" height="19" align="left" var="txt_lv"/>
			  <Label text="战力：" autoSize="left" x="112" y="70" width="43" height="18" align="left"/>
			  <ClipList value="222" clipWidth="10" align="left" url="png.a5.comps.clipList.clipList_S3" x="151" y="74" var="txt_fightValue"/>
			  <Button label="取消助战" x="238" y="67" style="按钮小红" var="btn_cancel"/>
			</PlayerRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_name:Label = null;
      
      public var txt_lv:Label = null;
      
      public var txt_fightValue:ClipList = null;
      
      public var btn_cancel:Button = null;
      
      public function ShenYuanHelpHeadUI()
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
