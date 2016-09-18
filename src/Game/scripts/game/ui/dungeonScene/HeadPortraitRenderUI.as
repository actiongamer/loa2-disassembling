package game.ui.dungeonScene
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.customs.components.ClipList;
   import morn.core.components.ProgressBar;
   
   public class HeadPortraitRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="86" height="115">
			  <Image skin="png.uiDungeonScene.battles.img_headerIconBg" x="5" y="15" var="img_bg" width="75" height="75"/>
			  <Image skin="png.comp.image" x="5" y="15" width="75" height="75" var="img_icon"/>
			  <ClipList value="0" clipWidth="84" align="left" url="png.uiDungeonScene.battles.clipList_headIcon" x="0" y="9" var="img_rim"/>
			  <Image skin="png.uiDungeonScene.battles.img_headerIconHpBarBg" x="1" y="95"/>
			  <Image skin="png.uiDungeonScene.battles.img_rageBg" x="5" y="101"/>
			  <ProgressBar skin="png.uiDungeonScene.battles.progress_angry" x="6" y="102" value="0" var="bar_angry"/>
			  <Image skin="png.uiDungeonScene.battles.img_hpBg" x="5" y="96"/>
			  <ProgressBar skin="png.uiDungeonScene.battles.progress_hp" x="6" y="97" value="0" var="bar_hp"/>
			  <ClipList value="0" clipWidth="21" align="left" url="png.uiDungeonScene.battles.clipList_tupo" x="7" y="3" var="bo0"/>
			  <ClipList value="0" clipWidth="21" align="left" url="png.uiDungeonScene.battles.clipList_tupo" x="25" y="3" var="bo1"/>
			  <ClipList value="0" clipWidth="21" align="left" url="png.uiDungeonScene.battles.clipList_tupo" x="43" y="3" var="bo2"/>
			</View>;
       
      
      public var img_bg:Image = null;
      
      public var img_icon:Image = null;
      
      public var img_rim:ClipList = null;
      
      public var bar_angry:ProgressBar = null;
      
      public var bar_hp:ProgressBar = null;
      
      public var bo0:ClipList = null;
      
      public var bo1:ClipList = null;
      
      public var bo2:ClipList = null;
      
      public function HeadPortraitRenderUI()
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
