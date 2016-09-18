package nslm2.modules.foundations.signIn
{
   public class SignInUtl
   {
       
      
      private var stcreward:String;
      
      private var signInState:Boolean;
      
      private var vipNum:int;
      
      private var vipMulti:int;
      
      private var canSignIn:Boolean;
      
      private var currOrder:Boolean;
      
      private var _effect:int;
      
      public function SignInUtl(param1:String, param2:Boolean, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int = 0)
      {
         super();
         this.stcreward = param1;
         this.signInState = param2;
         this.vipNum = param3;
         this.canSignIn = param4;
         this.currOrder = param5;
         this.vipMulti = param6;
         this._effect = param7;
      }
      
      public function get effect() : Boolean
      {
         return _effect == 1;
      }
      
      public function getStcReward() : String
      {
         return this.stcreward;
      }
      
      public function getSignState() : Boolean
      {
         return this.signInState;
      }
      
      public function getVipNum() : int
      {
         return this.vipNum;
      }
      
      public function getVipMulti() : int
      {
         return this.vipMulti;
      }
      
      public function getCanSignIn() : Boolean
      {
         return this.canSignIn;
      }
      
      public function setCanSignIn() : void
      {
         this.canSignIn = false;
      }
      
      public function setSignInState() : void
      {
         this.signInState = true;
      }
      
      public function getCurrOrder() : Boolean
      {
         return this.currOrder;
      }
   }
}
