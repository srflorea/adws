require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe DecisionsController do

  # This should return the minimal set of attributes required to create a valid
  # Decision. As you add validations to Decision, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "name" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DecisionsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all decisions as @decisions" do
      decision = Decision.create! valid_attributes
      get :index, {}, valid_session
      assigns(:decisions).should eq([decision])
    end
  end

  describe "GET show" do
    it "assigns the requested decision as @decision" do
      decision = Decision.create! valid_attributes
      get :show, {:id => decision.to_param}, valid_session
      assigns(:decision).should eq(decision)
    end
  end

  describe "GET new" do
    it "assigns a new decision as @decision" do
      get :new, {}, valid_session
      assigns(:decision).should be_a_new(Decision)
    end
  end

  describe "GET edit" do
    it "assigns the requested decision as @decision" do
      decision = Decision.create! valid_attributes
      get :edit, {:id => decision.to_param}, valid_session
      assigns(:decision).should eq(decision)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Decision" do
        expect {
          post :create, {:decision => valid_attributes}, valid_session
        }.to change(Decision, :count).by(1)
      end

      it "assigns a newly created decision as @decision" do
        post :create, {:decision => valid_attributes}, valid_session
        assigns(:decision).should be_a(Decision)
        assigns(:decision).should be_persisted
      end

      it "redirects to the created decision" do
        post :create, {:decision => valid_attributes}, valid_session
        response.should redirect_to(Decision.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved decision as @decision" do
        # Trigger the behavior that occurs when invalid params are submitted
        Decision.any_instance.stub(:save).and_return(false)
        post :create, {:decision => { "name" => "invalid value" }}, valid_session
        assigns(:decision).should be_a_new(Decision)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Decision.any_instance.stub(:save).and_return(false)
        post :create, {:decision => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested decision" do
        decision = Decision.create! valid_attributes
        # Assuming there are no other decisions in the database, this
        # specifies that the Decision created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Decision.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => decision.to_param, :decision => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested decision as @decision" do
        decision = Decision.create! valid_attributes
        put :update, {:id => decision.to_param, :decision => valid_attributes}, valid_session
        assigns(:decision).should eq(decision)
      end

      it "redirects to the decision" do
        decision = Decision.create! valid_attributes
        put :update, {:id => decision.to_param, :decision => valid_attributes}, valid_session
        response.should redirect_to(decision)
      end
    end

    describe "with invalid params" do
      it "assigns the decision as @decision" do
        decision = Decision.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Decision.any_instance.stub(:save).and_return(false)
        put :update, {:id => decision.to_param, :decision => { "name" => "invalid value" }}, valid_session
        assigns(:decision).should eq(decision)
      end

      it "re-renders the 'edit' template" do
        decision = Decision.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Decision.any_instance.stub(:save).and_return(false)
        put :update, {:id => decision.to_param, :decision => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested decision" do
      decision = Decision.create! valid_attributes
      expect {
        delete :destroy, {:id => decision.to_param}, valid_session
      }.to change(Decision, :count).by(-1)
    end

    it "redirects to the decisions list" do
      decision = Decision.create! valid_attributes
      delete :destroy, {:id => decision.to_param}, valid_session
      response.should redirect_to(decisions_url)
    end
  end

end
