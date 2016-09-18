package game.ui.roleInfos.phaseUps
{
   import morn.customs.components.SkillRender;
   import morn.core.components.Image;
   import morn.core.components.Label;
   
   public class RolePhaseUpSkillRenderUI extends SkillRender
   {
      
      protected static var uiView:XML = <SkillRender width="192" height="56" mouseChildren="true">
			  <Image skin="png.a5.bgs.iconBgs.img_iconBgItemS1_1" x="0" y="-1" sizeGrid="6,6,6,6" width="56" height="56" var="img_quality"/>
			  <Image skin="png.comp.image" x="3" y="2" width="50" height="50" var="img_icon"/>
			  <Label text="Lv.99" autoSize="none" x="111" y="29" width="51" align="left" var="txt_nextLevel" bold="false" style="普通绿色" mouseChildren="false" mouseEnabled="false" height="20"/>
			  <Label text="技能名字" x="63" y="5" size="12" width="129" height="18" align="left" var="txt_name" bold="false" style="随品质变化"/>
			  <Label text="Lv.99" autoSize="none" x="63" y="29" width="51" align="left" var="txt_level" bold="false" style="普通绿色" mouseChildren="false" mouseEnabled="false"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="110" y="34" rotation="90"/>
			  <Image skin="png.a5.commonImgs.img_arrowupS1" x="146" y="31" var="img_up"/>
			</SkillRender>;
       
      
      public var img_quality:Image = null;
      
      public var img_icon:Image = null;
      
      public var txt_nextLevel:Label = null;
      
      public var txt_name:Label = null;
      
      public var txt_level:Label = null;
      
      public var img_up:Image = null;
      
      public function RolePhaseUpSkillRenderUI()
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
