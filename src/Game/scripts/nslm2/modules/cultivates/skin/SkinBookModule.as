package nslm2.modules.cultivates.skin
{
   import game.ui.skinModule.SkinBookModuleUI;
   import com.mz.core.utils.DictHash;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcHeroSkinSuitVo;
   import nslm2.common.consts.NPCPropConsts;
   import game.ui.roleInfos.NpcPropVo;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import nslm2.utils.WealthUtil;
   import nslm2.modules.cultivates.skin.render.WealthRenderS9ForSkin;
   import game.ui.skinModule.render.WealthRenderS9ForSkinUI;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import flash.events.Event;
   import com.mz.core.utils.DisplayUtils;
   import flash.geom.Point;
   
   public class SkinBookModule extends SkinBookModuleUI
   {
       
      
      private var dict:DictHash;
      
      private var curNode:int = 0;
      
      public function SkinBookModule()
      {
         dict = new DictHash();
         super();
         this.panelBg.bgCustom.addChild(this.img_blackBg);
         this.panelBg.bgCustom.addChild(this.img_blackBg2);
         this.panelBg.bgCustom.addChild(this.img_bg);
      }
      
      public function get pageBar() : SkinBookPageBar
      {
         return this.pageBarUI as SkinBookPageBar;
      }
      
      override public function preShow(param1:Object = null) : void
      {
         var _loc3_:int = 0;
         var _loc6_:int = 0;
         var _loc5_:* = StcMgr.ins.getHeroSkinSuitTable().array;
         for each(var _loc4_ in StcMgr.ins.getHeroSkinSuitTable().array)
         {
            if(dict.containsKey(_loc4_.node))
            {
               if(curNode == 0)
               {
                  curNode = _loc4_.node;
               }
               dict.getValue(_loc4_.node).push(_loc4_);
            }
            else
            {
               dict.put(_loc4_.node,[_loc4_]);
            }
         }
         var _loc2_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < (dict.array.length > 3?dict.array.length:3))
         {
            if(dict.array.length > _loc3_)
            {
               _loc2_.push(1);
            }
            else
            {
               _loc2_.push(0);
            }
            _loc3_++;
         }
         this.list_title.dataSource = _loc2_;
         this.pageBar.bindList(this.list_title);
         this.list_title.selectedIndex = 0;
         this.list_title.selectHandler = listHandler;
         refresh();
         super.preShowCpl();
      }
      
      private function listHandler() : void
      {
         curNode = dict.getKey(dict.array[this.list_title.selectedIndex]);
         if(curNode > 0)
         {
            refresh();
         }
      }
      
      private function refresh() : void
      {
         var _loc2_:Array = [];
         var _loc4_:Array = NPCPropConsts.ins.baseProp5List.concat(NPCPropConsts.ins.fightPropList);
         _loc4_.push(22);
         var _loc1_:Array = NpcPropVo.createPropArrZero(_loc4_,"+");
         var _loc7_:int = 0;
         var _loc6_:* = SkinModel.ins.getSkinListByNodeId(curNode);
         for each(var _loc3_ in SkinModel.ins.getSkinListByNodeId(curNode))
         {
            _loc2_.push(WealthUtil.createItemVo(_loc3_.id));
         }
         var _loc9_:int = 0;
         var _loc8_:* = dict.getValue(curNode);
         for each(var _loc5_ in dict.getValue(curNode))
         {
            if(SkinModel.ins.getActivedCountNodeId(curNode) >= _loc5_.num)
            {
               NpcPropVo.addProp(_loc1_,NpcPropVo.parseArrStr(_loc5_.attr));
            }
         }
         this.list_skins.repeatX = _loc2_.length;
         this.list_skins.dataSource = _loc2_;
         this.list_skins.itemRender = WealthRenderS9ForSkin;
         (this.list_skins.cells[0] as WealthRenderS9ForSkinUI).img_plus.visible = false;
         this.txt_title.text = LocaleMgr.ins.getStr(dict.getValue(curNode)[0].total_name);
         this.list_suit.dataSource = (dict.getValue(curNode) as Array).sortOn("num");
         this.list_prop.dataSource = _loc1_;
      }
      
      override public function switchEventListeners(param1:Boolean) : void
      {
         if(param1)
         {
            SkinModel.ins.addEventListener("evtActivateCpl",onActivateCpl);
         }
         else
         {
            SkinModel.ins.removeEventListener("evtActivateCpl",onActivateCpl);
         }
         super.switchEventListeners(param1);
      }
      
      protected function onActivateCpl(param1:Event) : void
      {
         var _loc3_:Array = NPCPropConsts.ins.baseProp5List.concat(NPCPropConsts.ins.fightPropList);
         _loc3_.push(22);
         var _loc2_:Array = NpcPropVo.createPropArrZero(_loc3_,"+");
         var _loc6_:int = 0;
         var _loc5_:* = dict.getValue(curNode);
         for each(var _loc4_ in dict.getValue(curNode))
         {
            if(SkinModel.ins.getActivedCountNodeId(curNode) >= _loc4_.num)
            {
               NpcPropVo.addProp(_loc2_,NpcPropVo.parseArrStr(_loc4_.attr));
            }
         }
         _loc2_.forEach(setFloatPos);
         this.list_prop.dataSource = _loc2_;
         this.list_suit.dataSource = (dict.getValue(curNode) as Array).sortOn("num");
      }
      
      private function setFloatPos(param1:NpcPropVo, param2:int, param3:Array) : void
      {
         param1.floatPos = DisplayUtils.globarCenter(this).add(new Point(0,-50));
      }
   }
}
