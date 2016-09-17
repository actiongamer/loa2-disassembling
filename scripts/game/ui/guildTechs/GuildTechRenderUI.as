package game.ui.guildTechs
{
   import morn.core.components.View;
   import morn.core.components.Image;
   import morn.core.components.Button;
   import morn.core.components.Label;
   
   public class GuildTechRenderUI extends View
   {
      
      protected static var uiView:XML = <View width="180" height="200">
			  <Image skin="png.uiGuildTechs.科技小底" x="0" y="0" var="bg"/>
			  <Button label="按钮" x="49" y="134" style="按钮中绿" var="btn_study"/>
			  <Label text="渐变1" autoSize="none" x="44" y="9" style="渐变1" width="104" height="22" align="center" var="txt_typeName"/>
			  <Label text="渐变1" autoSize="none" x="82" y="60" style="普通说明" width="95" height="26" align="left" var="txt_level" size="15"/>
			  <Image skin="png.comp.image" var="img_icon" width="28" height="28" x="46" y="68" autoSize="true" anchorX="0.5" anchorY="0.5"/>
			  <GuildTechRenderWealthRender x="65" y="168" var="renderNeed" runtime="game.ui.guildTechs.GuildTechRenderWealthRenderUI"/>
			  <GuildTechPropRender x="35" y="109" var="renderEffectUI" runtime="game.ui.guildTechs.GuildTechPropRenderUI"/>
			  <Label text="学习该科技可以提升" autoSize="none" x="2" y="110" style="重要提示黄" width="176" height="26" align="center" var="txt_effect" size="14"/>
			</View>;
       
      
      public var bg:Image = null;
      
      public var btn_study:Button = null;
      
      public var txt_typeName:Label = null;
      
      public var txt_level:Label = null;
      
      public var img_icon:Image = null;
      
      public var renderNeed:game.ui.guildTechs.GuildTechRenderWealthRenderUI = null;
      
      public var renderEffectUI:game.ui.guildTechs.GuildTechPropRenderUI = null;
      
      public var txt_effect:Label = null;
      
      public function GuildTechRenderUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.guildTechs.GuildTechPropRenderUI"] = game.ui.guildTechs.GuildTechPropRenderUI;
         viewClassMap["game.ui.guildTechs.GuildTechRenderWealthRenderUI"] = game.ui.guildTechs.GuildTechRenderWealthRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
