package game.ui.roleInfos.awake
{
   import morn.customs.components.PopModuleView;
   import morn.core.components.Button;
   import game.ui.commons.icons.WealthRenderS14UI;
   import morn.core.components.Label;
   import game.ui.commons.icons.WealthRenderS18UI;
   import morn.core.components.List;
   import game.ui.roleInfos.awake.render.RoleAwakeEquipPropRenderUI;
   
   public class RoleAwakeEquipModuleUI extends PopModuleView
   {
      
      protected static var uiView:XML = <PopModuleView width="374" height="322">
			  <PanelBgS3 x="1" y="0" btnCloseStyle="1" width="372" height="317" frameStyle="2"/>
			  <Image skin="png.uiRoleInfo.awake.英雄-觉醒装备bj" x="12" y="32"/>
			  <Button style="按钮大绿" var="btn_equip" x="131" y="271" label="装备"/>
			  <Label x="31" y="145" width="177" height="22" size="12" text="\l30120018"/>
			  <Box x="31" y="185" width="146" height="55">
			    <WealthRenderS14 var="render_Extitem1" x="-1" y="-3" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			    <Label text="0/6" y="27" style="普通绿色" width="113" height="22" size="12" var="label_need1" align="left" x="63" lgx="63,63,63,63,63,63,63,63" lgy="27,27,27,27,27,27,27,32" language="ru"/>
			    <Label text="精炼之靴\na" y="2" width="113" align="left" var="label_ExtItem1" x="63" height="40" multiline="true" wordWrap="true" lgx="63,63,63,63,63,63,63,63" lgy="2,2,2,2,2,2,2,-5" language="ru"/>
			  </Box>
			  <Box x="209" y="182">
			    <WealthRenderS14 var="render_Extitem2" runtime="game.ui.commons.icons.WealthRenderS14UI"/>
			    <Label text="0/35" y="32" style="普通绿色" width="113" height="22" size="12" var="label_need2" align="left" x="64"/>
			    <Label text="觉醒石" y="7" width="63" align="left" height="20" var="label_ExtItem2" x="64"/>
			  </Box>
			  <WealthRenderS18 x="68" y="54" var="render_item" runtime="game.ui.commons.icons.WealthRenderS18UI"/>
			  <List x="147" y="87" width="198" spaceX="-5" var="list_prop">
			    <RoleAwakeEquipPropRender name="render" runtime="game.ui.roleInfos.awake.render.RoleAwakeEquipPropRenderUI"/>
			  </List>
			</PopModuleView>;
       
      
      public var btn_equip:Button = null;
      
      public var render_Extitem1:WealthRenderS14UI = null;
      
      public var label_need1:Label = null;
      
      public var label_ExtItem1:Label = null;
      
      public var render_Extitem2:WealthRenderS14UI = null;
      
      public var label_need2:Label = null;
      
      public var label_ExtItem2:Label = null;
      
      public var render_item:WealthRenderS18UI = null;
      
      public var list_prop:List = null;
      
      public function RoleAwakeEquipModuleUI()
      {
         super();
      }
      
      override protected function createChildren() : void
      {
         viewClassMap["game.ui.commons.icons.WealthRenderS14UI"] = WealthRenderS14UI;
         viewClassMap["game.ui.commons.icons.WealthRenderS18UI"] = WealthRenderS18UI;
         viewClassMap["game.ui.roleInfos.awake.render.RoleAwakeEquipPropRenderUI"] = RoleAwakeEquipPropRenderUI;
         super.createChildren();
         createView(uiView);
      }
   }
}
