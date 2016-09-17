package nslm2.modules.dungeons.scripts.cmds
{
   import morn.core.managers.timerMgrs.TimerHandlerVo;
   import morn.core.utils.StringUtils;
   import nslm2.modules.fightPlayer.UnitView;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import com.mz.core.configs.EnvConfig;
   import nslm2.modules.dungeons.scripts.comps.DramaSayListS3;
   import nslm2.utils.TransformUtil;
   import flash.geom.Vector3D;
   import flash.geom.Point;
   import com.mz.core.utils.DisplayUtils;
   import nslm2.modules.dungeons.scripts.vos.SayVo;
   import flash.events.Event;
   
   public class ScriptCmd_Say2 extends ScriptCmdBase
   {
       
      
      public function ScriptCmd_Say2()
      {
         super();
      }
      
      override public function onStart(param1:TimerHandlerVo) : void
      {
         var _loc4_:* = null;
         var _loc7_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc3_:* = null;
         var _loc2_:* = null;
         super.onStart(param1);
         if(StringUtils.isNull(vo.id) == false)
         {
            _loc4_ = this.findUnit(vo.id,false);
            if(_loc4_)
            {
               _loc7_ = _loc4_.vo.stcNpcVo;
            }
         }
         if(vo.stc_npc_id > 0)
         {
            _loc7_ = StcMgr.ins.getNpcVo(vo.stc_npc_id);
         }
         if(!this.vo.name)
         {
            if(_loc4_)
            {
               this.vo.name = _loc4_.vo.name;
            }
            else if(_loc7_)
            {
               this.vo.name = LocaleMgr.ins.getStr(int(_loc7_.name));
            }
            else
            {
               this.vo.name = "";
            }
         }
         if(this.vo.head_id)
         {
            _loc5_ = UrlLib.dialog(String(this.vo.head_id));
         }
         else if(_loc7_)
         {
            _loc5_ = UrlLib.dialog(_loc7_.head_id);
         }
         if(!this.vo.side)
         {
            if(_loc4_)
            {
               this.vo.side = _loc4_.vo.side;
            }
            else
            {
               this.vo.side = 1;
            }
         }
         if(EnvConfig.ins.scriptSayList)
         {
            if(DramaSayListS3.ins == null)
            {
               DramaSayListS3.ins = new DramaSayListS3();
               this.module.topLayer2D.addChild(DramaSayListS3.ins);
            }
            DramaSayListS3.ins.commitMeasure();
            if(_loc4_)
            {
               _loc3_ = TransformUtil.stage3Dto2D(_loc4_.avatarBox.scenePosition,module.topLayer2D);
               _loc6_ = new Point(_loc3_.x,_loc3_.y);
               _loc6_ = module.topLayer2D.localToGlobal(_loc6_);
            }
            else
            {
               _loc6_ = DisplayUtils.globarCenter(module.topLayer2D);
            }
            _loc2_ = new SayVo();
            if(_loc7_)
            {
               _loc2_.baseId = _loc7_.id;
            }
            _loc2_.isLeft = this.vo.side == 1;
            _loc2_.headerIconUrl = _loc5_;
            _loc2_.content = this.vo.talk;
            _loc2_.name = this.vo.name;
            _loc2_.fontBold = this.vo.fontBold;
            if(this.vo.fontColor)
            {
               _loc2_.fontColor = uint(this.vo.fontColor);
            }
            if(this.vo.fontSize)
            {
               _loc2_.fontSize = this.vo.fontSize;
            }
            DramaSayListS3.ins.add(_loc2_,_loc6_,dramaSayList_endHandler);
         }
      }
      
      private function dramaSayList_endHandler() : void
      {
         this.onEnd();
      }
      
      private function onClick(param1:Event) : void
      {
         this.onEnd();
      }
      
      override public function onStep(param1:TimerHandlerVo) : void
      {
         super.onStep(param1);
         if(this.vo.time > 0)
         {
            this.checkEnd();
         }
      }
      
      override public function onEnd() : void
      {
         super.onEnd();
      }
   }
}
