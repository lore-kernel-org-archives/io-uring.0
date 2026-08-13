Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C00A54749E8
	for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786638156; cv=pass; b=Gx14IWOm/8kZ6eQx24O7MqytUnn4X9yKwFEIASGl/IVyMPI6XdIAG1elamCE4+tjSbTnfq30mtRYH9fdnVBj4qCMcqf7d02LjtylMdM4P0DbRvkxv9ljRUAf+yeo5grBFV6uU2GBU7G3rXQVPWpLLFhebP25sr3vkWHqJ+jg37c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786638156; c=relaxed/simple;
	bh=1M8jeBf9OledPwCo3Y9KJxbjSgLkY7istZbzV+oE5wU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aHWYQtzLqw4RXkEnoAQ6NdtD9uGieFlTKC+ll4A86WeIShCds+iX8Tv/fQ/NhiPeV2tWxVrT7JsKzAZ9OK8Xg8Zdh8yBnM5jv12j1NapLYHw0UQ7jszVLLiJBzXSsSMAh0+T90ls8wXOM6E/CxW9MvpO0eTwcxf5tetQDQbRT3A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MHwa5Ehy; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MHwa5Ehy"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1c50c1e29bso16669166b.3
        for <io-uring@vger.kernel.org>; Thu, 13 Aug 2026 09:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786638153; cv=none;
        d=google.com; s=arc-20260327;
        b=dXdFO6KTNH62W1Bixqdn84CsAT5oSfGD3qHNEzfLsCAV7rdXzNX0nN7Sm8bWMEkdnz
         Udl76SIItHv27oLTPaCWHqKILBlTgMgEJRPQYJ66xE3CMd886zzxjSWKloeNZlsrpNau
         dpBf3Ke6XfgEmKqi+3RPJ5FaALe+ZGKg2yoPjhF8vtU4sLusECtBui7UiLaqtfsjpSSw
         5qq7/xUqbFp0mWmZUfNwqC/pdUq69DaEY/lee17pf1YaRdMLl5Mcd2WuZgg+aKdlJt/Z
         8w1knEJzkWPuupBvhm4MKAVRmdKqVl66qXT+4RAhkVki+7eu/xj8Jzro10Dn8Maqh/ii
         ysUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1M8jeBf9OledPwCo3Y9KJxbjSgLkY7istZbzV+oE5wU=;
        fh=FhGpWbT5ypxT5Sq+gmLgX6wDm9cHCETHxumBp0IlFCw=;
        b=UQu4R8ZzHNl0YqOxq+O31H9rVd/cJ01zV/RbBGqjvLe4B25Eqkp2Zkvcl0dyiyAa04
         YEQRdyTA53c1bdZ0lRgxODJatk+jq0G2UIgn3X7Y5kgoxW5mU8D8qGHpY2shhmRkDkvj
         /gN6YcpVhi7ruf79asJk/AxHd6hr9qmZ5VnTtajWCZAMWvO2yQqrM0+PjfljcJFomIi7
         QcIGyCEQxXs2b4Tr3Ag2S2F1x3FXCrx1Ocj8UTxG30DR+jEWaY94hB/fpkIsoYsqKc0z
         hKhFmFYW/EiQ/PLZVq7WDBflZdVADhK8xrLQO8GEds89VxOiQ0ArgRq0xYhSUezEIIND
         gX0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786638153; x=1787242953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1M8jeBf9OledPwCo3Y9KJxbjSgLkY7istZbzV+oE5wU=;
        b=MHwa5EhyAM0FaofYtdtvdQmpjJlo4IjQ0k2b7mFsPVZYU02s4f61/247GH0mX4Jpqx
         csN1GZ7sRrBTOWfdhMG1DLF+6MTh8hNZY9KhlEzbJ5+9g2AbAmLF3OiyaeORy+7sNCgc
         A8gTdVSuzmt7FLGJjCJ3eMlrmEq6abM+Tk5xTUNb4x0U5LqCSKjwe7ndX2oesacwYnCB
         TmsLuNKVqYwwHVC2z+6ZYt/ytjnJV4vbr45HxJl1B4ceShpJsi2XuvZXsanjatW1WWol
         J75Q8gOmFe0Y0BDOilP/F20vjQJxc3pZOoNBByabjt+R23/2I/dkVzWr9TwLiQjC0hYX
         3+7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786638153; x=1787242953;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1M8jeBf9OledPwCo3Y9KJxbjSgLkY7istZbzV+oE5wU=;
        b=iLSiXW4u79IVxq0O0zBvemC27RMM/XkaxFS1bGyiyJfZd3x/zW7RheO3R5DpjYdC6J
         G87dx+QP3J+4gx1SHPCLRNy/FkEfYhaBLN24g6iXSYL5AKMS15a374heduO1l2j6N4fa
         vHgvSmMIAgbupRZt6V3YtgCSdHwATGEyxVH8wk6jTc46SYAi9iHp8lNmF3uZnnlCBApq
         sZbOQwskccULsOGEhAoQLgurowjNqOGzC5XHo/ZvqZsdJaQ6L2QVX20lV7dm5uZCzKXy
         NQg0up243QW0EIMcw6qRou6QFEDS3ccZCX5NHOThFKvFLxwmmR9yMR45nLo3n6cvQSaj
         oY7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqimqX79MGE9qZtQXv333TCKAMyBDbkCp0B8Az5e+l703zfat1viejs/+cGR8ezYZVBGDFF2o8RSg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzdBSEYba60lu9mc9FFBtLRVEGdnKQWFDtDSshLth4sJOsaBvXa
	lW4wzrPiZE6ZBHgkOeVbwRqLIkIcY9YYfmu7vk5GDgvHBc7arBfa14UmBYZzaXRvxNlEgopzHBB
	eb9Njvc9Gp1ZDUkdSx1OSMke8PPQSBi4=
X-Gm-Gg: AR+sD13X1UJDa59/dQ1HrTByJ/J4ygu8K5VkK0Grf6l9h3rajS6fRgES4GpJdOeR8j6
	/ti6hwjDBG4MZnvw7xMcImEawwFRYnO4OXr8SZvdKl7OKjRmjotGrwGR7OsAZcva9ZSv493JD9j
	FOVI1Ljw5gRZ5EZhGugY4yennKHJxe18jZfn1YqyS8N4lhIaexKd4BYlqo7JieXn+nYM5rmJLjU
	hrH2fEGP21O5uVvxPnWE5Fc/svMyBOekHWZNTZPE7NyTzrSJKWR5S/p+qtuM2lQcnn5vPUISYrX
	Snm/SYvB0A8mC77SrL/cuZp8u6EhZ6xOUmotys/O1nvlmLO3EiJEItObIcbJRHKpqYCtvHoua0l
	Atylp4AGCo28=
X-Received: by 2002:a17:907:6d09:b0:c1f:5d05:34e8 with SMTP id
 a640c23a62f3a-c2108f7bc09mr325616666b.21.1786638152717; Thu, 13 Aug 2026
 09:22:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: io-uring@vger.kernel.org
List-Id: <io-uring.vger.kernel.org>
List-Subscribe: <mailto:io-uring+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:io-uring+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260721103514.2716-1-aditya.ansh182@gmail.com> <20260721103514.2716-3-aditya.ansh182@gmail.com>
In-Reply-To: <20260721103514.2716-3-aditya.ansh182@gmail.com>
From: Aditya Prakash Srivastava <aditya.ansh182@gmail.com>
Date: Thu, 13 Aug 2026 21:52:21 +0530
X-Gm-Features: AUfX_mzTIFv3kEMCf1avXYJ4M3WnrdtRtdhFOhLgeyhOjheLZR_On8grlkxDpyo
Message-ID: <CAK5ssPPMbH7oNTaA_iHM5_Az41LnmMTwGwZEMhkGpzCGF1uk1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] io_uring: add fremovexattr and flistxattr support
To: Jens Axboe <axboe@kernel.dk>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Jan Kara <jack@suse.cz>, io-uring@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 4:06=E2=80=AFPM Aditya Prakash Srivastava
<aditya.ansh182@gmail.com> wrote:
>
> Add support for IORING_OP_FREMOVEXATTR and IORING_OP_FLISTXATTR. This
> enables xattr listing and removal operations to be executed in an
> asynchronous fashion.
>

Hi,

Checking if there is any feedback/concern that needs to be
addressed with this patch?

Regards,
Aditya
