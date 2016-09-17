package nslm2.modules.footstones.tipMenus.handlers
{
   import nslm2.common.vo.WealthVo;
   import proto.Item;
   import proto.BaoWu;
   import nslm2.modules.roleInfos.equipPanels.EquipHeroPosVo;
   import nslm2.common.model.HeroModel;
   import proto.HeroInfo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.vos.StcItemVo;
   import com.mz.core.mgrs.ObserverMgr;
   
   public class ShowItemTipManueHandler extends TipMenuHandlerBase
   {
       
      
      public function ShowItemTipManueHandler()
      {
         super();
      }
      
      override public function exec() : void
      {
         var _loc2_:* = null;
         var _loc1_:* = null;
         var _loc3_:* = null;
         super.exec();
         if(this.data is WealthVo)
         {
            _loc2_ = (this.data as WealthVo).item;
            if(_loc2_)
            {
               toShowItem(_loc2_);
            }
            else
            {
               _loc1_ = (this.data as WealthVo).treasure;
               if(_loc1_)
               {
                  toShowBaowu(_loc1_);
               }
            }
         }
         else if(this.data is EquipHeroPosVo)
         {
            _loc3_ = this.data as EquipHeroPosVo;
            HeroModel.ins.getHeroInfo(_loc3_.heroId,getHeroInfoHandler);
         }
         else
         {
            throw new Error("TODO");
         }
      }
      
      private function getHeroInfoHandler(param1:HeroInfo) : void
      {
         var _loc7_:int = 0;
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc5_:* = null;
         var _loc4_:int = param1.items.length;
         var _loc3_:int = param1.baowu.length;
         _loc7_ = 0;
         while(_loc7_ < _loc4_)
         {
            _loc2_ = param1.items[_loc7_];
            if(_loc2_.place == (this.data as EquipHeroPosVo).pos)
            {
               toShowItem(_loc2_);
               break;
            }
            _loc7_++;
         }
         _loc7_ = 0;
         while(_loc7_ < _loc3_)
         {
            _loc5_ = param1.baowu[_loc7_];
            _loc6_ = StcMgr.ins.getItemVo(_loc5_.baseId);
            if(_loc6_.kind == (this.data as EquipHeroPosVo).pos)
            {
               toShowBaowu(_loc5_);
               break;
            }
            _loc7_++;
         }
      }
      
      private function toShowItem(param1:Item) : void
      {
         ObserverMgr.ins.sendNotice("MSG_ITEM_SEND_CHAT",param1);
      }
      
      private function toShowBaowu(param1:BaoWu) : void
      {
         ObserverMgr.ins.sendNotice("MSG_BAOWU_SEND_CHAT",param1);
      }
   }
}
