package game.ui.shenYuans
{
   import morn.core.components.View;
   import morn.core.components.Clip;
   import morn.customs.components.ClipList;
   import morn.core.components.Label;
   
   public class ShenYuanMosnterTipUI extends View
   {
      
      protected static var uiView:XML = <View width="308" height="58">
			  <Clip skin="png.uiShenYuan.clip_monster_bg" x="0" y="0" clipX="3" var="bg"/>
			  <Label text="得星倍率：" autoSize="left" x="92" y="41" style="普通说明" width="65" height="18" font="Microsoft YaHei" align="right"/>
			  <Label text="战力：" x="92" y="22" style="普通说明" width="65" height="18" font="Microsoft YaHei" align="right"/>
			  <Image skin="png.uiShenYuan.img_star" x="155" y="40"/>
			  <Image skin="png.uiShenYuan.img_x" x="177" y="44"/>
			  <ClipList value="222" clipWidth="10" align="left" url="png.a5.comps.clipList.clipList_S3" x="192" y="42" var="star_num"/>
			  <ClipList value="222" clipWidth="10" align="left" url="png.a5.comps.clipList.clipList_S3" x="159" y="23" var="txt_power"/>
			  <Label text="普通绿色" autoSize="left" x="124" y="3" style="普通绿色" var="txt_monsterName" font="Microsoft YaHei"/>
			</View>;
       
      
      public var bg:Clip = null;
      
      public var star_num:ClipList = null;
      
      public var txt_power:ClipList = null;
      
      public var txt_monsterName:Label = null;
      
      public function ShenYuanMosnterTipUI()
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
