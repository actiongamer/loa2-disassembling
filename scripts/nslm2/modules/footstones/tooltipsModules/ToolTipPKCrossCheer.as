package nslm2.modules.footstones.tooltipsModules
{
   import nslm2.modules.footstones.tooltipsModules.uis.TooltipUICommon;
   import proto.CrossArenaFinalEnemyInfo;
   import proto.CrossArenaDistCheerReq;
   import nslm2.mgrs.stcMgrs.vos.StcCrossArenaCheerVo;
   import proto.CrossArenaCheerInfo;
   import morn.core.components.Label;
   import morn.core.components.List;
   import proto.CrossArenaDistCheerRes;
   import nslm2.nets.sockets.ServerEngine;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.funnies.pkCrossSer.PKCrossComp.PKCheerBuffRender;
   
   public class ToolTipPKCrossCheer extends TooltipUICommon
   {
       
      
      public function ToolTipPKCrossCheer()
      {
         super();
      }
      
      override public function show(param1:*, param2:* = null) : void
      {
         $data = param1;
         $serverData = param2;
         onDataRet = function(param1:CrossArenaDistCheerRes):void
         {
            var _loc3_:* = null;
            if(!param1)
            {
               return;
            }
            var _loc5_:int = 0;
            var _loc4_:* = param1.cheerInfos;
            for each(var _loc2_ in param1.cheerInfos)
            {
               _loc3_ = getSerInfo(_loc2_.cheerId,list.array);
               if(_loc3_)
               {
                  _loc3_.level = _loc2_.level;
               }
            }
            list.refresh();
         };
         getSerInfo = function(param1:int, param2:Array):CrossArenaCheerInfo
         {
            var _loc5_:int = 0;
            var _loc4_:* = param2;
            for each(var _loc3_ in param2)
            {
               if(_loc3_.cheerId == param1)
               {
                  return _loc3_;
               }
            }
            return null;
         };
         super.show($data,$serverData);
         var vo:CrossArenaFinalEnemyInfo = $data as CrossArenaFinalEnemyInfo;
         var req:CrossArenaDistCheerReq = new CrossArenaDistCheerReq();
         req.dist = vo.baseInfo.dist;
         ServerEngine.ins.send(4322,req,onDataRet);
         var cheers:Array = StcMgr.ins.getCrossArenaCheerTable().array;
         cheers.sortOn("id");
         var vos:Array = [];
         var _loc5_:int = 0;
         var _loc4_:* = cheers;
         for each(item in cheers)
         {
            var cinfo:CrossArenaCheerInfo = new CrossArenaCheerInfo();
            cinfo.cheerId = item.id;
            cinfo.level = 0;
            vos.push(cinfo);
         }
         var lab:Label = new Label();
         lab.text = LocaleMgr.ins.getStr(50600039);
         lab.y = 4;
         lab.x = 15;
         this.addChild(lab);
         var list:List = new List();
         list.itemRender = PKCheerBuffRender;
         list.repeatX = vos.length;
         list.array = vos;
         list.spaceX = 4;
         list.centerX = 0;
         this.box.addChild(list);
         this.validateSize();
      }
   }
}
