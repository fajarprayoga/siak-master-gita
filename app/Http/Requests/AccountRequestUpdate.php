<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
class AccountRequestUpdate extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'code' => [
                'required',
                'min:3',
                Rule::unique('accounts', 'code')->ignore($this->account)
            ],
            'name' => [
                'required',
                Rule::unique('accounts', 'name')->ignore($this->account)
            ]
        ];
    }
}