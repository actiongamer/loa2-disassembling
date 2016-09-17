package nslm2.modules.scenes.commons
{
   import com.mz.core.interFace.IObserver;
   import flash.geom.Point;
   import com.mz.core.mgrs.ObserverMgr;
   import com.mz.core.geom.PoiAndRoVo;
   import nslm2.common.model.PlayerModel;
   import away3d.containers.ObjectContainer3D;
   
   public class SceneCurPlayer3D extends ScenePlayer3D implements IObserver
   {
       
      
      private var _ngNpc:nslm2.modules.scenes.commons.SceneNpc3D;
      
      public function SceneCurPlayer3D(param1:ObjectContainer3D = null)
      {
         super(param1);
         this.buttonMode = false;
         ObserverMgr.ins.regObserver(this);
      }
      
      override public function set pos2d(param1:Point) : void
      {
         .super.pos2d = param1;
      }
      
      override protected function validateMouseEvent() : void
      {
         super.validateMouseEvent();
         if(this.avatar)
         {
            this.avatar.mouseChildren = false;
            this.avatar.mouseEnabled = false;
            this.switchMouseEvent(this.avatar,false);
         }
         if(horseAvatar)
         {
            this.horseAvatar.mouseChildren = false;
            this.horseAvatar.mouseEnabled = false;
            this.switchMouseEvent(this.horseAvatar,false);
         }
      }
      
      public function get ngNpc() : nslm2.modules.scenes.commons.SceneNpc3D
      {
         return _ngNpc;
      }
      
      public function set ngNpc(param1:nslm2.modules.scenes.commons.SceneNpc3D) : void
      {
         if(_ngNpc != param1)
         {
            _ngNpc = param1;
         }
      }
      
      override protected function validatePos() : void
      {
         ObserverMgr.ins.sendNotice("msg_player_hero_CHANGE_POS",new PoiAndRoVo(pos2d,this.rotation));
         super.validatePos();
      }
      
      override protected function countRunPath(param1:int, param2:int) : Array
      {
         var _loc3_:Point = this.pos2d.clone();
         var _loc4_:Array = SceneModel.ins.findPathMed.getMovePath(_loc3_,new Point(param1,param2),true);
         return _loc4_;
      }
      
      override public function dispose() : void
      {
         ObserverMgr.ins.unregObserver(this);
         super.dispose();
      }
      
      public function getFocusNotices() : Array
      {
         return ["HORSE_CHANGE","MSG_GM_CMD","MSG_VIP_CHANGE"];
      }
      
      public function handleNotices(param1:String, param2:*) : void
      {
         var _loc3_:* = param1;
         if("MSG_VIP_CHANGE" !== _loc3_)
         {
            if("MSG_GM_CMD" !== _loc3_)
            {
               if("HORSE_CHANGE" === _loc3_)
               {
                  this.initStcHorseId(param2);
               }
            }
            else
            {
               if(param2 == "s0")
               {
                  this.avatar.scaleAll = 1;
                  this.horseAvatar.scaleAll = 1;
                  this.box3D2.scaleAll = 1;
               }
               if(param2 == "s1")
               {
                  this.box3D2.scaleAll = this.box3D2.scaleAll + 0.2;
               }
               if(param2 == "s2")
               {
                  this.box3D2.scaleAll = this.box3D2.scaleAll - 0.2;
               }
            }
         }
         else
         {
            this.tag3DVBox.initVip(PlayerModel.ins.vipInfoVo);
         }
      }
   }
}
