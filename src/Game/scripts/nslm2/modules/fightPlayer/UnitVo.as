package nslm2.modules.fightPlayer
{
   import flash.events.EventDispatcher;
   import com.mz.core.interFace.IDispose;
   import proto.BattlePlayer;
   import nslm2.modules.footstones.localeModules.LocaleMgr;
   import nslm2.modules.footstones.loadingModules.UrlLib;
   import nslm2.mgrs.stcMgrs.vos.StcNpcVo;
   import nslm2.mgrs.stcMgrs.StcMgr;
   import nslm2.mgrs.stcMgrs.StcLackFatal;
   import nslm2.mgrs.stcMgrs.vos.StcModelVo;
   import nslm2.common.model.PlayerModel;
   import flash.geom.Point;
   import com.mz.core.event.MzEvent;
   
   public class UnitVo extends EventDispatcher implements IDispose
   {
       
      
      public var id:String;
      
      public var isMajor:Boolean = false;
      
      public var isAttack:int;
      
      public var isBossScene:Boolean = false;
      
      public var posId:int;
      
      private var _name:String;
      
      private var _npc_id:int;
      
      public var rotation:int;
      
      public var state:int = 1;
      
      public var xy:Point;
      
      private var _hp:Number;
      
      public var hp_max:int;
      
      public var rage:int = 0;
      
      public var oriXY:Point;
      
      public var moveSpeed:Number = 1;
      
      private var _serVo:BattlePlayer;
      
      public var sumDamage:Number;
      
      public var sumHurt:Number;
      
      public var sumHeal:Number;
      
      private var _attack:int;
      
      public function UnitVo()
      {
         xy = new Point();
         super();
      }
      
      public function get serVo() : BattlePlayer
      {
         return _serVo;
      }
      
      public function set serVo(param1:BattlePlayer) : void
      {
         _serVo = param1;
      }
      
      public function get side() : int
      {
         return isAttack == 1?1:2;
      }
      
      public function get name() : String
      {
         if(_name == null)
         {
            if(serVo && serVo.kind == 5)
            {
               _name = serVo.name;
            }
            else
            {
               _name = LocaleMgr.ins.getStr(int(stcNpcVo.name));
            }
         }
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function get dialogUrl() : String
      {
         return UrlLib.dialog(stcNpcVo.head_id);
      }
      
      public function get npc_id() : int
      {
         return _npc_id;
      }
      
      public function set npc_id(param1:int) : void
      {
         _npc_id = param1;
      }
      
      public function get stcNpcVo() : StcNpcVo
      {
         var _loc1_:StcNpcVo = StcMgr.ins.getNpcVo(int(this.npc_id));
         if(_loc1_)
         {
            return _loc1_;
         }
         new StcLackFatal(this,"static_npc",this.npc_id);
         return null;
      }
      
      public function get sex() : int
      {
         return this.stcNpcVo.sex;
      }
      
      public function get fashionId() : int
      {
         if(serVo && serVo.avatar && serVo.avatar.length >= 1)
         {
            return serVo.avatar[0];
         }
         return 0;
      }
      
      public function get body_stcModel3DVo() : StcModelVo
      {
         var _loc2_:uint = this.stcNpcVo.model_id;
         if(serVo && serVo.avatar && serVo.avatar.length >= 1)
         {
            _loc2_ = serVo.avatar[0];
            _loc2_ = PlayerModel.ins.getModelIdByStcId(_loc2_,this.npc_id);
         }
         var _loc1_:StcModelVo = StcMgr.ins.getModelVo(_loc2_);
         if(_loc1_)
         {
            return _loc1_;
         }
         new StcLackFatal(this,"static_model",this.stcNpcVo.model_id);
         return null;
      }
      
      public function get wing_stcModel3DVo() : StcModelVo
      {
         var _loc1_:* = 0;
         if(this.stcNpcVo)
         {
            _loc1_ = uint(this.stcNpcVo.wing_id);
            if(serVo && serVo.avatar && serVo.avatar.length >= 2)
            {
               _loc1_ = uint(serVo.avatar[1]);
               _loc1_ = uint(PlayerModel.ins.getModelIdByStcId(_loc1_,this.npc_id,true));
            }
            if(_loc1_)
            {
               return StcMgr.ins.getModelVo(_loc1_);
            }
            return null;
         }
         return null;
      }
      
      public function get x() : int
      {
         return xy.x;
      }
      
      public function get y() : int
      {
         return xy.y;
      }
      
      public function set x(param1:int) : void
      {
      }
      
      public function set y(param1:int) : void
      {
      }
      
      public function get hp() : Number
      {
         return _hp;
      }
      
      public function set hp(param1:Number) : void
      {
         if(_hp != param1)
         {
            _hp = param1;
            this.dispatchEvent(new MzEvent("valueChange",param1));
         }
      }
      
      public function init(param1:Boolean = false) : void
      {
         oriXY = PosConts.oriXY(this.posId,this.isAttack == 1,param1);
         this.rotation = this.isAttack == 1?0:Number(180);
         reOriPoi();
         this.isBossScene = param1;
      }
      
      public function reOriPoi() : void
      {
         xy = oriXY.clone();
      }
      
      public function get attack() : int
      {
         if(_attack == 0)
         {
            return this.stcNpcVo.attack;
         }
         return _attack;
      }
      
      public function set attack(param1:int) : void
      {
         _attack = param1;
      }
      
      public function dispose() : void
      {
      }
   }
}
