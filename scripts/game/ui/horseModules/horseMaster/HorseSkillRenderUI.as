package game.ui.horseModules.horseMaster
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Label;
   import morn.core.components.Box;
   import morn.core.components.Image;
   
   public class HorseSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="129" height="107">
			  <Label text="（所有坐骑技能等级均会提升）" x="1" y="59" width="128" var="txt_desc" style="普通说明" align="center" mouseEnabled="false" height="55" wordWrap="true"/>
			  <Box y="3" var="box_skill">
			    <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" var="img_quality" width="32" height="32" x="2" y="21"/>
			    <Image skin="png.comp.image" width="28" height="28" var="img_icon" x="4" y="23"/>
			    <Image skin="png.uiHorse.masterInfo.img_blueBg" x="22" y="0"/>
			    <Label text="Lv.99" autoSize="none" x="25" y="39" width="51" height="18" align="right" var="txt_level" bold="false" style="重要提示绿"/>
			    <Label text="天谴怒击" autoSize="none" x="39" y="21" height="18" align="right" var="txt_name" bold="false" style="重要提示橘黄" size="13"/>
			    <Label text="\l30300045" width="131" style="重要提示绿" align="center" mouseEnabled="false" x="0" y="0"/>
			    <Image skin="png.a5.commonImgs.img_arrowupS1" x="76" y="41" var="arrowUp"/>
			  </Box>
			</SkillRender>;
       
      
      public var txt_desc:Label = null;
      
      public var box_skill:Box = null;
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_level:Label = null;
      
      public var txt_name:Label = null;
      
      public var arrowUp:Image = null;
      
      public function HorseSkillRenderUI()
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
